MODULE LIBRARY

USE MATHLIB

IMPLICIT NONE

TYPE PULSEFEATURES

INTEGER*8 :: Ncycles,Rcycles,Fcycles
REAL*8 :: Ampli,Omega,Phi,FWHM,Delay
CHARACTER(LEN=20) :: ENVELOPE

END TYPE PULSEFEATURES

CONTAINS

!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
!%                                                                            $
!%                                                                            $
!%                        SUBROUTINE ABSORBED_ENERGY                          $
!%                                                                            $
!%                                                                            $
!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

!==============================================================================
!
! This subroutine calculates the total absorbed energy by the electron cloud
! from the laser pulse during the time interval [0,tau] as
!
!                 E_abs=int_0^tau d(t)F_t(t)
!
! where F_t(t) is the time derivative of the electric field.
!
!==============================================================================

SUBROUTINE ABSORBED_ENERGY(Ngrid_time,step_time,DIPOLE_GEN,FIELD)

IMPLICIT NONE

! Input/Output variables

INTEGER*8 :: Ngrid_time
REAL*8 :: step_time

REAL*8, DIMENSION(Ngrid_time+1) :: FIELD
COMPLEX*16, DIMENSION(Ngrid_time+1) :: DIPOLE_GEN

! Local variables

INTEGER*8 :: i
REAL*8 :: t,CUM_ABSENER

REAL*8, DIMENSION(Ngrid_time+1) :: DERIVEE,ABSENER

OPEN(200,file='Inst_AbsEnergy.dat',position='append')
OPEN(210,file='Absorbed_Energy.dat',position='append')

DO i=1,Ngrid_time

   IF (i == 1) THEN

      DERIVEE(i)=FIELD(i+1)/(2.D0*step_time)

   ELSE IF (i /= Ngrid_time) THEN

      DERIVEE(i)=-FIELD(i-1)+FIELD(i+1)
      DERIVEE(i)=DERIVEE(i)/(2.D0*step_time)

   ELSE IF (i == Ngrid_time) THEN

      DERIVEE(i)=-FIELD(i-1)/(2.D0*step_time)

   END IF

   ABSENER(i)=REAL(DIPOLE_GEN(i))*DERIVEE(i)

   WRITE(200,*)REAL(i)*step_time,ABSENER(i)

   CUM_ABSENER=CUM_ABSENER+ABSENER(i)

   WRITE(210,*)REAL(i)*step_time,step_time*CUM_ABSENER

END DO

CLOSE(200)
CLOSE(210)

END SUBROUTINE ABSORBED_ENERGY

!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
!%                                                                            $
!%                                                                            $
!%                        SUBROUTINE DIPOLE_GENERAL                           $
!%                                                                            $
!%                                                                            $
!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

!==============================================================================
!
! This subroutine calculates the general complex electronic dipole at t 
! defined by
!
!                             D(t)=Sum_i^N < Psi_i(t) | r | Psi_i(t) >
!
!==============================================================================

SUBROUTINE DIPOLE_GENERAL(TIME_COUNT,Ngrid_time,step_time,Norb,DIPOLE_TIME,&
&DIPOLE_GEN)

IMPLICIT NONE

! Input/Ouput variables

INTEGER*8 :: TIME_COUNT,Ngrid_time,Norb
REAL*8 :: step_time
COMPLEX*16 :: DIPOLE
COMPLEX*16, DIMENSION(Ngrid_time+1,Norb) :: DIPOLE_TIME
COMPLEX*16, DIMENSION(Ngrid_time+1) :: DIPOLE_GEN

! Local variables

INTEGER*8 :: i,Orbital
REAL*8 :: t

OPEN(160,file='Dipole_General.dat',position='append')

t=REAL(TIME_COUNT-1)*step_time

DIPOLE=DCMPLX(0.D0,0.D0)

DO Orbital=1,Norb

   DIPOLE=DIPOLE+DIPOLE_TIME(TIME_COUNT,Orbital)

END DO

DIPOLE_GEN(TIME_COUNT)=DIPOLE

WRITE(160,*)t,REAL(DIPOLE_GEN(TIME_COUNT)),AIMAG(DIPOLE_GEN(TIME_COUNT))

CLOSE(160)

RETURN

END SUBROUTINE DIPOLE_GENERAL

!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
!%                                                                            $
!%                                                                            $
!%                               SUBROUTINE DIPOLE                            $
!%                                                                            $
!%                                                                            $
!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

!==============================================================================
!
! This subroutine calculates the complex electronic dipole of a wavefunction 
! at t defined by
!
!                             d(t)=< Psi(t) | r | Psi(t) >
!
!==============================================================================

SUBROUTINE DIPOLE(TIME_COUNT,Ngrid_time,Ngrid_r,Norb,lmax,mmax,&
&RADIAL,QN_m,t,Dipole_Matrix,DIPOLE_TIME)

IMPLICIT NONE

! Input/Output variables

INTEGER*8 :: TIME_COUNT,Ngrid_time,Ngrid_r,Norb,lmax,mmax
REAL*8 :: t
INTEGER*8, DIMENSION(Norb) :: QN_m
REAL*8, DIMENSION(Ngrid_r,0:lmax,0:mmax) :: Dipole_Matrix
COMPLEX*16, DIMENSION(Ngrid_time+1,Norb) :: DIPOLE_TIME
COMPLEX*16, DIMENSION(Ngrid_r,0:lmax,Norb) :: RADIAL

! Local variables

INTEGER*8 :: i,l,lprime,Orbital
REAL*8 :: DIPOLE_RE,DIPOLE_IM

CHARACTER(LEN=50) :: filename

REAL*8, PARAMETER :: PI=3.14159265358979D0

DO Orbital=1,Norb

   DIPOLE_RE=0.D0
   DIPOLE_IM=0.D0

   DO i=1,Ngrid_r

      DO l=QN_m(Orbital),lmax

         lprime=l-1

         ! Compute real and imaginary part of the dipole

         IF (lprime .GE. 0) THEN

            DIPOLE_RE=DIPOLE_RE+REAL(CONJG(RADIAL(i,l,Orbital))&
                 &*Dipole_Matrix(i,lprime,QN_m(Orbital))&
                 &*RADIAL(i,lprime,Orbital))

            DIPOLE_IM=DIPOLE_IM+AIMAG(CONJG(RADIAL(i,l,Orbital))&
                 &*Dipole_Matrix(i,lprime,QN_m(Orbital))&
                 &*RADIAL(i,lprime,Orbital))
            

         END IF

         lprime=l+1

         IF (lprime .LE. lmax) THEN

            DIPOLE_RE=DIPOLE_RE+REAL(CONJG(RADIAL(i,l,Orbital))&
                 &*Dipole_Matrix(i,l,QN_m(Orbital))&
                 &*RADIAL(i,lprime,Orbital))

            DIPOLE_IM=DIPOLE_IM+AIMAG(CONJG(RADIAL(i,l,Orbital))&
                 &*Dipole_Matrix(i,l,QN_m(Orbital))&
                 &*RADIAL(i,lprime,Orbital))

         END IF

      END DO

   END DO

   ! Reconstruct the full dipole

   DIPOLE_TIME(TIME_COUNT,Orbital)=DCMPLX(DIPOLE_RE,DIPOLE_IM)

   WRITE(filename,'(a12,I3.3,a4)')'Dipole_Norb=',Orbital,'.dat'
   OPEN(100,file=filename,position='append')
   WRITE(100,*)t,DIPOLE_RE,DIPOLE_IM

END DO

CLOSE(100)

RETURN

END SUBROUTINE DIPOLE

!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
!%                                                                            $
!%                                                                            $
!%                               SUBROUTINE NESC                              $
!%                                                                            $
!%                                                                            $
!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

!==============================================================================
!
! This subroutine calculates the number of escaped electrons at t using the 
! formula
!
!                         Nesc(t)=N(t=0)-N(t)
! 
! where N(t) is defined as
!
!                         N(t)=int_0^R n(r,t)
!
! and n(r,t) as
!
!                        n(r,t)=sum_i^N f_i |Phi|**2
!
! where Psi is developed over lmax angular momenta.
!
!==============================================================================

SUBROUTINE NESC(Z,TIME_COUNT,Ngrid_time,Integration,Ngrid_r,Norb,lmax,RADIAL,&
&QN_m,OCC,t)

IMPLICIT NONE

! Input/Output variables

INTEGER*8 :: Z,TIME_COUNT,Ngrid_time,Integration,Ngrid_r,Norb,lmax
REAL*8 :: t
INTEGER*8, DIMENSION(Norb) :: QN_m,OCC
COMPLEX*16, DIMENSION(Ngrid_r,0:lmax,Norb) :: RADIAL

! Local variables

INTEGER*8 :: i,l,Orbital
REAL*8 :: NELECTRONS
REAL*8, DIMENSION(Ngrid_time+1) :: N_ESC

CHARACTER(LEN=50) :: filename

REAL*8, PARAMETER :: PI=3.14159265358979D0

NELECTRONS=0.D0

DO Orbital=1,Norb

   DO i=1,Integration

      DO l=QN_m(Orbital),lmax

         ! Summation over all angular momenta

         NELECTRONS=NELECTRONS+OCC(Orbital)*CONJG(RADIAL(i,l,Orbital))&
              &*RADIAL(i,l,Orbital)

      END DO

   END DO

END DO

N_ESC(TIME_COUNT)=REAL(Z)-NELECTRONS

WRITE(filename,'(a18)')'Nesc_Electrons.dat'
OPEN(170,file=filename,position='append')
WRITE(170,*)t,N_ESC(TIME_COUNT)

CLOSE(170)

RETURN

END SUBROUTINE NESC

!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
!%                                                                            $
!%                                                                            $
!%                               SUBROUTINE PROBA                             $
!%                                                                            $
!%                                                                            $
!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

!==============================================================================
!
! This subroutine calculates the probability of a wavefunction at t integrated
! over an integration region defined by
!
!                         Proba(t)=int_0^R Psi*(t) Psi(t)
!
! where Psi is developed over lmax angular momenta.
!
!==============================================================================

SUBROUTINE PROBA(TIME_COUNT,Ngrid_time,Integration,Ngrid_r,Norb,lmax,RADIAL,&
&QN_m,t,PROBA_OCC)

IMPLICIT NONE

! Input/Output variables

INTEGER*8 :: TIME_COUNT,Ngrid_time,Integration,Ngrid_r,Norb,lmax
REAL*8 :: t
INTEGER*8, DIMENSION(Norb) :: QN_m
REAL*8, DIMENSION(Ngrid_time+1,Norb) :: PROBA_OCC
COMPLEX*16, DIMENSION(Ngrid_r,0:lmax,Norb) :: RADIAL

! Local variables

INTEGER*8 :: i,l,Orbital
REAL*8 :: PROBABILITY

CHARACTER(LEN=50) :: filename

REAL*8, PARAMETER :: PI=3.14159265358979D0

DO Orbital=1,Norb

   PROBABILITY=0.D0

   DO i=1,Integration

      DO l=QN_m(Orbital),lmax

         ! Summation over all angular momenta

         PROBABILITY=PROBABILITY+CONJG(RADIAL(i,l,Orbital))*RADIAL(i,l,Orbital)

      END DO

   END DO

   PROBA_OCC(TIME_COUNT,Orbital)=PROBABILITY

   WRITE(filename,'(a17,I3.3,a4)')'Probability_Norb=',Orbital,'.dat'
   OPEN(90,file=filename,position='append')
   WRITE(90,*)t,PROBABILITY

END DO

CLOSE(90)

RETURN

END SUBROUTINE PROBA

!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
!%                                                                            $
!%                                                                            $
!%                                SUBROUTINE NORM                             $
!%                                                                            $
!%                                                                            $
!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

!==============================================================================
!
! This subroutine calculates the norm of a wavefunction at t defined by
!
!                          N(t)=< Psi(t) | Psi(t) >
!
! where Psi is developed over lmax angular momenta.
!
!==============================================================================

SUBROUTINE WAVE_NORM(Ngrid_r,Norb,lmax,RADIAL,QN_m,t)

IMPLICIT NONE

! Input/Output variables

INTEGER*8 :: Ngrid_r,Norb,lmax
REAL*8 :: t
INTEGER*8, DIMENSION(Norb) :: QN_m
COMPLEX*16, DIMENSION(Ngrid_r,0:lmax,Norb) :: RADIAL

! Local variables

INTEGER*8 :: i,l,Orbital
REAL*8 :: NORM

CHARACTER(LEN=50) :: filename

REAL*8, PARAMETER :: PI=3.14159265358979D0

DO Orbital=1,Norb

   NORM=0.D0

   DO i=1,Ngrid_r

      DO l=QN_m(Orbital),lmax

         ! Summation over all angular momenta

         NORM=NORM+CONJG(RADIAL(i,l,Orbital))*RADIAL(i,l,Orbital)

      END DO

   END DO

   WRITE(filename,'(a13,I3.3,a4)')'WF_Norm_Norb=',Orbital,'.dat'
   OPEN(80,file=filename,position='append')
   WRITE(80,*)t,NORM

END DO

CLOSE(80)

RETURN

END SUBROUTINE WAVE_NORM

!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
!%                                                                            $
!%                                                                            $
!%                           SUBROUTINE PROJECTION                            $
!%                                                                            $
!%                                                                            $
!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

!==============================================================================
!
! This subroutine calculates the projection of a wavefunction at t onto its 
! evalutation at t0 (Ground-state projection) defined by
!
!                 Projection=< Psi(t=0) | Psi (t) > 
!
!==============================================================================

SUBROUTINE PROJECTION(Ngrid_r,Norb,lmax,GROUND_STATE,RADIAL,&
&QN_l,t)

IMPLICIT NONE

! Input/Output variables

INTEGER*8 :: Ngrid_r,Norb,lmax
REAL*8 :: t
INTEGER*8, DIMENSION(Norb) :: QN_l
COMPLEX*16, DIMENSION(Ngrid_r,Norb) :: GROUND_STATE
COMPLEX*16, DIMENSION(Ngrid_r,0:lmax,Norb) :: RADIAL

! Local variables

INTEGER*8 :: i,Orbital
REAL*8 :: PROJECTION_RE,PROJECTION_IM

CHARACTER(LEN=50) :: filename

REAL*8, PARAMETER :: PI=3.14159265358979D0

DO Orbital=1,Norb

   PROJECTION_RE=0.D0
   PROJECTION_IM=0.D0

   DO i=1,Ngrid_r

      PROJECTION_RE=PROJECTION_RE+REAL(CONJG(GROUND_STATE(i,Orbital))&
           &*RADIAL(i,QN_l(Orbital),Orbital))

      PROJECTION_IM=PROJECTION_IM+AIMAG(CONJG(GROUND_STATE(i,Orbital))&
           &*RADIAL(i,QN_l(Orbital),Orbital))

   END DO

   WRITE(filename,'(a19,I3.3,a4)')'GS_Projection_Norb=',Orbital,'.dat'
   OPEN(70,file=filename,position='append')
   WRITE(70,*)t,PROJECTION_RE,PROJECTION_IM

END DO

CLOSE(70)

RETURN

END SUBROUTINE PROJECTION

!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
!%                                                                            $
!%                                                                            $
!%                               FUNCTION LASER                               $
!%                                                                            $
!%                                                                            $
!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

!==============================================================================
!
! This function evaluates the laser electric field at t.
!
!==============================================================================

FUNCTION PULSE(t1,PULSEFEAT,NPulses)

IMPLICIT NONE

! Input/Output variables

INTEGER*8 :: NPulses
TYPE(PULSEFEATURES) :: PULSEFEAT(NPulses)

REAL*8 :: t,t1,PULSE

! Local variables

INTEGER*8 :: i
REAL*8 :: F0,w,p,PUL
REAL*8 :: Alpha,Shift,Tau,N

REAL*8, PARAMETER :: PI=3.14159265358979D0

PULSE=0.D0

DO i=1,NPulses

   F0=PULSEFEAT(i)%Ampli
   w=PULSEFEAT(i)%Omega
   p=PULSEFEAT(i)%Phi
   t=t1-PULSEFEAT(i)%Delay
   
   !PRINT*,'t',t

   SELECT CASE (PULSEFEAT(i)%ENVELOPE)

   CASE ("SinSqr")

      N=REAL(PULSEFEAT(i)%Ncycles)
      Tau=2.D0*PI*N/w
 
      IF ((t .GT. 0.D0) .AND. (t .LE. Tau)) THEN            

         PUL=F0*DSIN(w*t+p)*(DSIN(PI*t/Tau))**2

      ELSE

         PUL=0.D0

      ENDIF

   CASE ("Gaussian")

      Alpha=4.D0*LOG(2.D0)/(PULSEFEAT(i)%FWHM**2)
      Shift=2.5D0*PULSEFEAT(i)%FWHM

      PUL=F0*DEXP(-Alpha*(t-Shift)**2)*DCOS(w*(t-Shift)+p)

   CASE ("Ramped")

      Tau=2.D0*PI/w

      IF (t .LE. REAL(PULSEFEAT(i)%Rcycles)*Tau) THEN

         PUL=F0*(DSIN(PI*t/(10.D0*Tau)))**2*DSIN(w*t+p)

      ELSE IF (t .LE. REAL(PULSEFEAT(i)%Fcycles)*Tau) THEN

         PUL=F0*DSIN(w*t+p)

      END IF  

   END SELECT

   PULSE=PULSE+PUL

END DO

RETURN

END FUNCTION PULSE

!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
!%                                                                            $
!%                                                                            $
!%                          SUBROUTINE EIGEN_VALUES                           $
!%                                                                            $
!%                                                                            $
!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

!==============================================================================
!
! This subroutine calculates the eigenvalues using LAPACK's DSBEV subroutine.
!
!==============================================================================

SUBROUTINE EIGEN_VALUES(Ngrid_r,Ndiag,KS_MATRIX,Eigenvalues)

IMPLICIT NONE

! Input/Output variables

INTEGER*8 :: Ngrid_r,Ndiag
REAL*8, DIMENSION(0:Ndiag,Ngrid_r) :: KS_MATRIX
REAL*8, DIMENSION(Ngrid_r) :: Eigenvalues

! Local variables

INTEGER*8 :: i,INFO
REAL*8, DIMENSION(Ngrid_r) :: W
REAL*8, DIMENSION(3*Ngrid_r) :: WORK
REAL*8, DIMENSION(Ndiag+1,Ngrid_r) :: AB
REAL*8, DIMENSION(1,1) :: Z

AB=KS_MATRIX

CALL DSBEV('N','L',Ngrid_r,Ndiag,AB,Ndiag+1,W,Z,1,WORK,INFO)

DO i=1,Ngrid_r

   Eigenvalues(i)=W(i)

END DO

RETURN

END SUBROUTINE EIGEN_VALUES

!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
!%                                                                            $
!%                                                                            $
!%                          SUBROUTINE EIGEN_VECTORS                          $
!%                                                                            $
!%                                                                            $
!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

!==============================================================================
!
! This subroutine calculates the eigenvectors using LAPACK's DGBSV subroutine.
! It calculates one eigenvector for a selected eigenvalue. It uses a numerical
! recipes scheme for accelerating the calculation, where the eigenvector
! calculation is repeated three times. The fact that we do not need all 
! eigenvectors, this is why we select the useful ones.
!
!==============================================================================

SUBROUTINE EIGEN_VECTORS(Ngrid_r,Ndiag,KS_MATRIX,Energy,Eigenvectors)

IMPLICIT NONE

! Input/Ouput variables

INTEGER*8 :: Ngrid_r,Ndiag
REAL*8 :: Energy
REAL*8, DIMENSION(0:Ndiag,Ngrid_r) :: KS_MATRIX
REAL*8, DIMENSION(Ngrid_r) :: Eigenvectors

! Local variables

INTEGER*8 :: i,j,k,INFO
INTEGER*8, DIMENSION(Ngrid_r) :: IPIV
REAL*8 :: Norm
REAL*8, DIMENSION(Ngrid_r,1) :: B
REAL*8, DIMENSION(2*Ndiag+Ndiag+1,Ngrid_r) :: AB_VEC

B=1.D0/REAL(Ngrid_r)

DO k=1,3

   AB_VEC=0.D0

   DO j=1,Ngrid_r

      DO i=MAX(1,j-Ndiag),MIN(Ngrid_r,j+Ndiag)

         ! Constructing the Eigensystem
         ! (A-lamba*I)=0

         AB_VEC(Ndiag+Ndiag+1+i-j,j)=KS_MATRIX(ABS(i-j),j) 
         
         IF (i .EQ. j) AB_VEC(Ndiag+Ndiag+1+i-j,j)=AB_VEC(Ndiag+Ndiag+1+i-j,j)-&
              &Energy

      END DO

   END DO

   CALL DGBSV(Ngrid_r,Ndiag,Ndiag,1,AB_VEC,2*Ndiag+Ndiag+1,IPIV,B,Ngrid_r,INFO)

   Norm=1.D0/SQRT(DOT_PRODUCT(B(1:Ngrid_r,1),B(1:Ngrid_r,1)))

   B(1:Ngrid_r,1)=Norm*B(1:Ngrid_r,1)

   !PRINT*,'INFO',INFO
   !STOP

END DO

! Normalizing (or not) the radial part of wavefunctions 
! (i.e. the Eigenvectors)

DO i=1,Ngrid_r

   !Eigenvectors(i)=B(i,1)/SQRT(step_r)  ! Radial part normalized
   Eigenvectors(i)=B(i,1)             ! or not

END DO

RETURN

END SUBROUTINE EIGEN_VECTORS

!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
!%                                                                            $
!%                                                                            $
!%                             SUBROUTINE EFFPOTMAT                           $
!%                                                                            $
!%                                                                            $
!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

!==============================================================================
!
! This subroutine computes all the bocks of the Effective potential matrix.
!
!==============================================================================

SUBROUTINE EFFPOTMAT(r,Ngrid_r,Ngrid_t,step_r,lmax,mmax,Norb,QN_m,&
&OCC,RADIAL,L_Coupling,EFFPOT,XC_TYPE,IFDENS,TIME_COUNT,NbDensity)

IMPLICIT NONE

! Input/Output variables

INTEGER*8 :: Ngrid_r,Ngrid_t,lmax,mmax,Norb,L_Coupling,TIME_COUNT,NbDensity
REAL*8 :: step_r
CHARACTER(LEN=20) :: XC_TYPE
INTEGER*8, DIMENSION(Norb) :: QN_m,OCC
REAL*8, DIMENSION(Ngrid_r) :: r
DOUBLE PRECISION, DIMENSION(Ngrid_r,0:lmax,0:lmax,0:mmax) :: EFFPOT
COMPLEX*16, DIMENSION(Ngrid_r,0:lmax,Norb) :: RADIAL

LOGICAL :: IFDENS

! Local variables

INTEGER*8 :: i,j,l,lprime,m,Orbital
REAL*8 :: COEF
REAL*8, DIMENSION(Ngrid_t) :: GL_ARG,GL_WEIGHTS
REAL*8, DIMENSION(Ngrid_r,0:L_Coupling) :: DENSITY_L,HARTREE_POT_L
REAL*8, DIMENSION(Ngrid_r,Ngrid_t) :: DENSITY_FULL,DENSITY,XC_POT,POTENTIAL
REAL*8, DIMENSION(0:lmax,0:mmax,Ngrid_t) :: PLM
COMPLEX*16, DIMENSION(Ngrid_r,Ngrid_t) :: WF

CHARACTER(LEN=50) :: filename

REAL*8, PARAMETER :: PI=3.14159265358979D0

! Loading quantities for Gauss-Legendre integration over cos(theta) 
! between [-1,+1] for a linear distribution in cos(theta) and get rid 
! of the Gauss-Legendre coefficient.

CALL INTEG_GAUSS_LEG(Ngrid_t,-1.D0,1.D0,COEF,GL_ARG,GL_WEIGHTS)

DO j=1,Ngrid_t
   GL_ARG(j)=ACOS(GL_ARG(j))            ! theta=acos(cos(theta))
   GL_WEIGHTS(j)=2.D0*PI*GL_WEIGHTS(j)  ! Integration over phi leads to 2*pi
END DO

! Loading "Reduced" Spherical Harmonics

DO m=0,mmax

   DO l=m,lmax
      
      DO j=1,Ngrid_t

         !PLM(l,m,j)=TILDE_P_lm(l,m,GL_ARG(j))
         PLM(l,m,j)=spharm(l,m,GL_ARG(j),0.d0)
            if(m>0)PLM(l,m,j)=PLM(l,m,j)/1.414213562373095048801d0

         !PRINT*,'PLM',PLM(l,m,j)

      END DO

      !READ(*,*)

   END DO

END DO

! Save the density at NbDensity time steps in cartesian coordinates

!PRINT*,'NbDensity',NbDensity

IF (IFDENS .AND. MOD(TIME_COUNT,NbDensity)==0) THEN

   WRITE(filename,'(a10,I5.5,a4)')'Density_t=',TIME_COUNT,'.dat'
   OPEN(60,file=filename)

   DO i=1,Ngrid_r

      DO j=1,Ngrid_t

         WRITE(60,*)r(i)*COS(GL_ARG(j)),r(i)*SIN(GL_ARG(j)),DENSITY_FULL(i,j)

      END DO

      DO j=1,Ngrid_t

         WRITE(60,*)r(i)*COS(GL_ARG(j)+PI),r(i)*SIN(GL_ARG(j)+PI),DENSITY_FULL(i,j)

      END DO

      WRITE(60,*)r(i)*COS(GL_ARG(1)),r(i)*SIN(GL_ARG(1)),DENSITY_FULL(i,1)

     WRITE(60,*)

   END DO
         
END IF

! Compute each wavefunction and the density

DENSITY_FULL=0.D0 ! Initialize the full density

DO Orbital=1,Norb
   
   m=QN_m(Orbital) ! Compute magnetic momentum

   WF=DCMPLX(0.D0,0.D0) ! Initialize the wavefunction

   DO i=1,Ngrid_r

      DO j=1,Ngrid_t

         DO l=m,lmax

            ! Summation over all angular momenta to calculate the wavefunction

            WF(i,j)=WF(i,j)+RADIAL(i,l,Orbital)*PLM(l,m,j)
            !WF(i,j)=WF(i,j)+RADIAL(i,l,Orbital)*TILDE_P_lm(l,m,GL_ARG(j))

         END DO 

         ! Compute the full density

         DENSITY_FULL(i,j)=DENSITY_FULL(i,j)+OCC(Orbital)*CONJG(WF(i,j))*WF(i,j)

      END DO

   END DO

END DO

! Compute the density suited for the Exchange-Correlation potential

DENSITY=0.D0

DO i=1,Ngrid_r

   DO j=1,Ngrid_t

      DENSITY(i,j)=DENSITY_FULL(i,j)/(r(i)**2*step_r)

   END DO

END DO

! Compute the Exchange-Correlation potential

CALL XCPOT(XC_TYPE,Ngrid_r,Ngrid_t,DENSITY,XC_POT)

! Store the Exchange-Correlation potential into the potential

DO i=1,Ngrid_r

   DO j=1,Ngrid_t

      POTENTIAL(i,j)=XC_POT(i,j)

   END DO

END DO

!POTENTIAL=0.D0

! Compute preliminary the density in function of l for the Hartree potential

DENSITY_L=0.D0

DO l=0,L_Coupling

   DO i=1,Ngrid_r

      DO j=1,Ngrid_t

         DENSITY_L(i,l)=DENSITY_L(i,l)+GL_WEIGHTS(j)*DENSITY_FULL(i,j)*&
              &PLM(l,0,j)
         !DENSITY_L(i,l)=DENSITY_L(i,l)+GL_WEIGHTS(j)*DENSITY_FULL(i,j)*&
         !     &TILDE_P_l(l,GL_ARG(j))

      END DO

   END DO

END DO

! Load the Hartree potential in function of l-momentum E [0,L_Coupling]

!CALL HARTREE_L(r,Ngrid_r,step_r,L_Coupling,DENSITY_L,HARTREE_POT_L)

    do l=0,L_Coupling
      call hartree(l,DENSITY_L(1:Ngrid_r,l),HARTREE_POT_L(1:Ngrid_r,l)&
           &,step_r,Ngrid_r)
    end do

!HARTREE_POT_L=0.D0

! Compute the Effective potential

DO l=0,L_Coupling

   DO i=1,Ngrid_r

      DO j=1,Ngrid_t

         POTENTIAL(i,j)=POTENTIAL(i,j)+HARTREE_POT_L(i,l)*PLM(l,0,j)
         !POTENTIAL(i,j)=POTENTIAL(i,j)+HARTREE_POT_L(i,l)*&
         !     &TILDE_P_l(l,GL_ARG(j))

      END DO

   END DO

END DO

!POTENTIAL=1.D0

! Compute all the blocks of the full Effective potential matrix.
! The Upper blocks are computed first, then the whole matrix is filled
! by symmetry

EFFPOT=0.D0

DO m=0,mmax

   DO l=m,lmax

      DO lprime=l,lmax
         
         DO i=1,Ngrid_r

            DO j=1,Ngrid_t

               EFFPOT(i,l,lprime,m)=EFFPOT(i,l,lprime,m)+GL_WEIGHTS(j)*&
                    &POTENTIAL(i,j)*PLM(l,m,j)*PLM(lprime,m,j)
               !EFFPOT(i,l,lprime,m)=EFFPOT(i,l,lprime,m)+GL_WEIGHTS(j)*&
               !     &POTENTIAL(i,j)*TILDE_P_lm(l,m,GL_ARG(j))*&
               !     &TILDE_P_lm(lprime,m,GL_ARG(j))

            END DO

         END DO

      END DO
      
   END DO

   DO l=m,lmax

      DO lprime=m,l-1
         
         DO i=1,Ngrid_r

            EFFPOT(i,l,lprime,m)=EFFPOT(i,lprime,l,m) 

         END DO

      END DO

   END DO

END DO

!EFFPOT=0.D0

RETURN

END SUBROUTINE EFFPOTMAT

!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
!%                                                                            $
!%                                                                            $
!%                             SUBROUTINE XCPOT                               $
!%                                                                            $
!%                                                                            $
!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

!==============================================================================
!
! This subroutine simply selects which Exchange-Correlation potential is 
! computed with respect to XC_POT.
!
!==============================================================================

SUBROUTINE XCPOT(XC_TYPE,Ngrid_r,Ngrid_t,DENSITY,XC_POT)

IMPLICIT NONE

! Inout/Output variables

INTEGER*8 :: Ngrid_r,Ngrid_t
REAL*8, DIMENSION(Ngrid_r,Ngrid_t) :: DENSITY,XC_POT
CHARACTER(LEN=20) :: XC_TYPE

SELECT CASE(XC_TYPE)

   CASE("LDA")

      CALL LDAPOT(Ngrid_r,Ngrid_t,DENSITY,XC_POT)

   CASE("GTH")

      CALL GTHPOT(Ngrid_r,Ngrid_t,DENSITY,XC_POT)

END SELECT

RETURN

END SUBROUTINE XCPOT

!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
!%                                                                            $
!%                                                                            $
!%                            SUBROUTINE LDAPOT                               $
!%                                                                            $
!%                                                                            $
!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

!==============================================================================
!
! This subroutine calculates the LDA potential which is defined form the
! Thomas-Fermi homogenous gas formula as
!
!              LDAPOT(r,theta)=-A*density**(1/3)   A=(3/pi)**(1/3)
!
!==============================================================================

SUBROUTINE LDAPOT(Ngrid_r,Ngrid_t,DENSITY,XC_POT)

IMPLICIT NONE

! Input/Output variables

INTEGER*8 :: Ngrid_r,Ngrid_t
REAL*8, DIMENSION(Ngrid_r,Ngrid_t) :: DENSITY,XC_POT

! Local variables

INTEGER*8 :: i,j

REAL*8, PARAMETER :: PI=3.14159265358979D0

XC_POT=0.D0

! Calculating the LDA potential from Thomas-Fermi homogeneous gaz

DO i=1,Ngrid_r ! Scanning over {r} grid

   DO j=1,Ngrid_t ! Scanning over {theta} grid
   
      XC_POT(i,j)=-(3.D0*DENSITY(i,j)/PI)**(1.D0/3.D0)

   END DO

END DO

RETURN

END SUBROUTINE LDAPOT

!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
!%                                                                            $
!%                                                                            $
!%                            SUBROUTINE GTHPOT                               $
!%                                                                            $
!%                                                                            $
!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

!==============================================================================
!
!
!==============================================================================

SUBROUTINE GTHPOT(Ngrid_r,Ngrid_t,DENSITY,XC_POT)

IMPLICIT NONE

! Input/Output variables

INTEGER*8 :: i,j,Ngrid_r,Ngrid_t
REAL*8, DIMENSION(Ngrid_r,Ngrid_t) :: DENSITY,XC_POT

! Local variables

REAL*8 :: r,rs,raux,Num,Den

XC_POT=0.D0

DO i=1,Ngrid_r
   
   DO j=1,Ngrid_t
   
      IF(DENSITY(i,j) < 1.D-50) THEN
 
         XC_POT(i,j)=0.D0

      ELSE

         raux=ABS(DENSITY(i,j))**(1.D0/3.D0)
         rs=0.6203504908994D0/raux
         r=1.D0/raux
         
         Num=-7.414957276723736991D0&
              *(0.136680664290162743D0+0.73469462026452427D0*r+r**2)&
              *(33.297070039078416D0+11.2232890039996268D0*r+r**2)&
              *(3803.9016297715651D0+120.771946590387852D0*r+r**2)
         Den=4.1353599463455564707D0*r&
              *(0.379853439262446661849D0+r)**2&
              *(6.80317134907974952996D0+r)**2&
              *(68.7035989350263995779D0+r)**2
       
      !   raux=ABS(DENSITY(i,j))**(.3333333333333333333333_8)
      !   rs=0.6203504908994_8/raux
      !   r=1.D0/raux
         
      !   Num=-7.414957276723736991_8&
      !      *(0.136680664290162743_8+0.73469462026452427_8*r+r**2)&
      !      *(33.297070039078416_8+11.2232890039996268_8*r+r**2)&
      !      *(3803.9016297715651_8+120.771946590387852_8*r+r**2)
      !   Den=4.1353599463455564707_8*r&
      !      *(0.379853439262446661849_8+r)**2&
      !      *(6.80317134907974952996_8+r)**2&
      !      *(68.7035989350263995779_8+r)**2
  
         XC_POT(i,j)=Num/Den

         !PRINT*,'XC_POT',XC_POT(i,j)
         !READ(*,*)

      END IF

   END DO

END DO

RETURN

END SUBROUTINE GTHPOT

!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
!%                                                                            $
!%                                                                            $
!%                            SUBROUTINE HARTREE_L                            $
!%                                                                            $
!%                                                                            $
!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

!==============================================================================
!
! This subroutine calculates the l-contribution momentum to the Hartree 
! potential which is defined as
!
!               V_H_l(r)=4*Pi/(2l+1)*(r**(-l+1)*I+r**l*J)
!
! where each I and J integrals are defined as
!
!              I_l,i=I_l,i-1+n_l,i-1*a^I_l,i-n,l,i*b^I_l,i
!              J_l,i=J_l,i+1-n_l,i+1*a^J_l,i+1+n_l,i*b^J_l,i+1
!
! and each a^I,b^I,a^J and b^J quantities as
!
!              a^I_l,i=r_i*x^I_l,i-y^I_l,i
!              b^I_l,i=r_i-1*x^I_l,i-y^I_l,i
!              a^J_l,i=r_i-1*x^J_l,i-y^J_l,i
!              b^J_l,i=r_i*x^J_l,i-y^I_l,i
!
! with
!
!              x^I_l,i=(r_i^l+1-r_i-1^l+1)/[(l+1)*Delta r]
!              y^I_l,i=(r_i^l+2-r_i-1^l+2)/[(l+2)*Delta r]
!              x^J_l,i=(r_i^-l-r_i-1^-l)/[-l*Delta r]
!              y^I_l,i=(r_i^-l+1-r_i-1^-l+1)/[(-l+1)*Delta r]
!
!==============================================================================

SUBROUTINE HARTREE_L(r,Ngrid_r,step_r,L_Coupling,DENSITY_L,V_H_L)

IMPLICIT NONE

! Input/Output variables declaration

INTEGER*8 :: Ngrid_r,L_Coupling
REAL*8 :: step_r
REAL*8, DIMENSION(Ngrid_r) :: r
REAL*8, DIMENSION(Ngrid_r,0:L_Coupling) :: DENSITY_L,V_H_L

! Subroutine variables declaration

INTEGER*8 :: i,j,l
REAL*8 :: x_I,y_I,x_J,y_J
REAL*8, DIMENSION(Ngrid_r,0:L_Coupling) :: a_I,b_I,a_J,b_J
REAL*8, DIMENSION(Ngrid_r,0:L_Coupling) :: I_L,J_L

REAL*8, PARAMETER :: PI=3.14159265358979D0

!OPEN(30,file='Integral_I.dat')
!OPEN(31,file='Integral_J.dat')
!OPEN(32,file='a_I.dat')
!OPEN(33,file='b_I.dat')
!OPEN(34,file='a_J.dat')
!OPEN(35,file='b_J.dat')
!OPEN(36,file='Hartree_l.dat')
!OPEN(37,file='Density-in-Hartree.dat')

! Calculating quantities involved in I and J integrals for extreme radial
! grid points

I_L=0.D0
J_L=0.D0

DO l=0,L_Coupling

   I_L(1,l)=DENSITY_L(1,l)*r(1)**(l+2)/(REAL(l+2)*step_r)
   J_L(Ngrid_r,l)=0.D0

   a_I(1,l)=r(1)**(l+2)/(REAL(l+1)*step_r)-r(1)**(l+2)/(REAL(l+2)*step_r)
   b_I(1,l)=-r(1)**(l+2)/(REAL(l+2)*step_r)

   IF (l .EQ. 1) THEN ! Selecting the correct expression of a_J

      a_J(1,l)=-LOG(r(1))/step_r

   ELSE

      a_J(1,l)=-r(1)**(-l+1)/(REAL(-l+1)*step_r)
   
   END IF

   IF (l .EQ. 0) THEN ! Selecting the correct expression of b_J

      b_J(1,l)=r(1)*LOG(r(1))/step_r-r(1)**(-l+1)/(REAL(-l+1)*step_r)

   ELSE IF (l .EQ. 1) THEN

      b_J(1,l)=r(1)**(-l+1)/(REAL(-l)*step_r)-LOG(r(1))/step_r

   ELSE

      b_J(1,l)=r(1)**(-l+1)/(REAL(-l)*step_r)-r(1)**(-l+1)/(REAL(-l+1)*step_r)

   END IF

   ! Calculating a_I,b_I,a_J,b_J for the rest of the radial grid points

   DO i=2,Ngrid_r

      x_I=(r(i)**(l+1)-r(i-1)**(l+1))/(REAL(l+1)*step_r)
      y_I=(r(i)**(l+2)-r(i-1)**(l+2))/(REAL(l+2)*step_r)

      a_I(i,l)=r(i)*x_I-y_I
      b_I(i,l)=r(i-1)*x_I-y_I

      IF (l .EQ. 0) THEN

         x_J=(LOG(r(i))-LOG(r(i-1)))/step_r
      
      ELSE

         x_J=(r(i)**(-l)-r(i-1)**(-l))/(REAL(-l)*step_r)

      END IF

      IF (l .EQ. 1) THEN

         y_J=(LOG(r(i))-LOG(r(i-1)))/step_r

      ELSE

         y_J=(r(i)**(-l+1)-r(i-1)**(-l+1))/(REAL(-l+1)*step_r)

      END IF

      a_J(i,l)=r(i-1)*x_J-y_J
      b_J(i,l)=r(i)*x_J-y_J

   END DO

   ! Calculating I and J integrals for each radial grid points

   DO i=2,Ngrid_r

      I_L(i,l)=I_L(i-1,l)+DENSITY_L(i-1,l)*a_I(i,l)-DENSITY_L(i,l)*b_I(i,l)
   
      !PRINT*,'I_L(i,l)',I_L(i,l)

      j=Ngrid_r-i+1 ! For J, the indice starts from the other radial 
                    ! grid extremity

      J_L(j,l)=J_L(j+1,l)-DENSITY_L(j+1,l)*a_J(j+1,l)+DENSITY_L(j,l)*b_J(j+1,l)

      !PRINT*,'J_L(j,l)',J_L(j,l)
  
   END DO

   ! Calculating the l-momentum contribution to the Hartree potential

   DO i=1,Ngrid_r

      V_H_L(i,l)=(4.D0*PI/REAL(2*l+1))*(I_L(i,l)*r(i)**(-(l+1))&
           &+J_L(i,l)*r(i)**l)/step_r

      !   WRITE(36,*)r(i),V_H_L(i,l)
      !   WRITE(30,*)r(i),I_L(i,l)
      !   WRITE(31,*)r(i),J_L(i,l)
      !   WRITE(32,*)i,a_I(i)
      !   WRITE(33,*)i,b_I(i)
      !   WRITE(34,*)i,a_J(i,l)
      !   WRITE(35,*)i,b_J(i,l)
      !   WRITE(37,*)r(i),DENSITY_L(i,l)/10.D0


      !IF (L_Coupling /= 0) THEN
      !PRINT*,'V_H_L(i,l)',V_H_L(i,l)
      !PRINT*,'l',l
      !READ(*,*)
      !END IF

   END DO

END DO

!CLOSE(30)
!CLOSE(31)
!CLOSE(34)
!CLOSE(35)
!CLOSE(36)

!STOP

RETURN

END SUBROUTINE HARTREE_L

  subroutine hartree(l,rho,pot,dr,nr)
    
    implicit none
    integer*8,intent(in) :: l,nr
    double precision :: dr
    double precision,intent(in) :: rho(:)
    double precision,intent(out) :: pot(:)

    integer*8 :: i,j,allerr,il
    logical,save :: first=.TRUE.
    double precision,save,allocatable :: ai(:,:),bi(:,:),ci(:,:),di(:,:),&
        aj(:,:),bj(:,:),cj(:,:),dj(:,:)
    double precision :: r1,r2,x,y,iint(0:nr),jint(0:nr)

    if(first)then

      allocate(ai(0:9,1:nr),bi(0:9,1:nr),ci(0:9,1:nr),di(0:9,1:nr),stat=a&
          &llerr)
      if(allerr.NE.0)then
        write(0,*)"ai","bi","ci","di",": allocation request denied.   error&
            & code is",allerr
        stop;
      end if
      ai=0;
      bi=0;
      ci=0;
      di=0

      allocate(aj(0:9,1:nr),bj(0:9,1:nr),cj(0:9,1:nr),dj(0:9,1:nr),stat=a&
          &llerr)
      if(allerr.NE.0)then
        write(0,*)"aj","bj","cj","dj",": allocation request denied.   error&
            & code is",allerr
        stop;
      end if
      aj=0;
      bj=0;
      cj=0;
      dj=0
      do i=1,nr
        r1=(i-1)*dr
        r2=i*dr
        do il=0,9
          ci(il,i)=r2**(-(il+1))
          cj(il,i)=r2**il
          di(il,i)=-(il+1)*r2**(-(il+2))
          dj(il,i)=il*r2**(il-1)
          x=(r2**(il+1)-r1**(il+1))/((il+1)*dr)
          y=(r2**(il+2)-r1**(il+2))/((il+2)*dr)
          ai(il,i)=r2*x-y
          bi(il,i)=r1*x-y
          if (il == 0) then
             aj(il,i)=-r2**(-il+1)/((-il+1)*dr)
             bj(il,i)=r2*log(r2)/dr-r2**(-il+1)/((-il+1)*dr)
             else if (il==1) then
             aj(il,i)=-log(r2)/dr
             bj(il,i)=r2*r2**(-il)/((-il)*dr)-log(r2)/dr
             else if (il > 1) then
             aj(il,i)=-r2**(-il+1)/((-il+1)*dr)
             bj(il,i)=r2*r2**(-il)/((-il)*dr)-r2**(-il+1)/((-il+1)*dr)
          end if
          if(i>1)then
            if(il==0)then
              x=(log(r2)-log(r1))/dr
            else
              x=(r2**(-il)-r1**(-il))/((-il)*dr)
            end if
            if(il==1)then
              y=(log(r2)-log(r1))/dr
            else
              y=(r2**(-il+1)-r1**(-il+1))/((-il+1)*dr)
            end if
            aj(il,i)=r1*x-y
            bj(il,i)=r2*x-y
          end if
        end do
      end do
      first=.FALSE.
    end if

    iint(1)=-rho(1)*bi(l,1)
    j=nr
    jint(nr)=0
    do i=2,nr
      iint(i)=iint(i-1)+rho(i-1)*ai(l,i)-rho(i)*bi(l,i)
      j=nr-i+1
      jint(j)=jint(j+1)+rho(j)*bj(l,j+1)-rho(j+1)*aj(l,j+1)
    end do

    !do i=1,nr
    !print*,'aj',aj(0,i)
    !end do

    !do i=1,nr
    !print*,'bj',bj(0,i)
    !if(i==50)stop
    !end do

    !stop

    !do i=1,nr
    !print*,'iint',iint(i)
    !end do

    !stop

    !do i=1,nr
    !print*,'jint',jint(i)
    !end do

    !stop

    pot(1:nr)=((12.56637061435917295385d0/(2*l+1))/dr)&
        *(ci(l,1:nr)*iint(1:nr)+cj(l,1:nr)*jint(1:nr))

    !do i=1,nr
    !   print*,'pot',pot(i)
    !end do
    !stop

    ! stop
  end subroutine hartree


END MODULE LIBRARY
