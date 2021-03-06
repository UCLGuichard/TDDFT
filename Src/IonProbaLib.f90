MODULE IONPROBALIB

CONTAINS

!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
!%                                                                            $
!%                                                                            $
!%                        SUBROUTINE IONIZATION_PROBA                         $
!%                                                                            $
!%                                                                            $
!%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

!==============================================================================
!
! This subroutine calculates the ionization probabilities for each state of
! of the system considered.
!
!==============================================================================

SUBROUTINE IONIZATION_PROBA(Z,TIME_COUNT,Ngrid_time,Norb,PROBA_OCC,t)

IMPLICIT NONE

! Input/Output variables

INTEGER*8 :: Z,TIME_COUNT,Ngrid_time,Norb
REAL*8 :: t
REAL*8, DIMENSION(Ngrid_time+1,Norb) :: PROBA_OCC

! Local variables

REAL*8 :: a,b,c,d,e,f,g,h,i,j,k,l,m,n
REAL*8 :: a2,b2,c2,d2,e2,f2,g2,h2,i2,j2,k2,l2,m2,n2
REAL*8 :: g3,h3,n3,m3
REAL*8 :: g4,h4,n4,m4

REAL*8 :: IONIZATION
REAL*8, DIMENSION(0:Z) :: IONIZ_PROBA

CHARACTER(LEN=*), PARAMETER :: FMT="(ES20.10E3,ES20.10E3,ES20.10E3,&
&ES20.10E3,ES20.10E3,ES20.10E3,ES20.10E3,ES20.10E3,ES20.10E3,ES20.10E3,&
&ES20.10E3,ES20.10E3)"

CHARACTER(LEN=*), PARAMETER :: FMT2="(ES20.10E3,ES20.10E3,ES20.10E3,&
&ES20.10E3,ES20.10E3,ES20.10E3,ES20.10E3,ES20.10E3,ES20.10E3,ES20.10E3,&
&ES20.10E3,ES20.10E3,ES20.10E3,ES20.10E3,ES20.10E3,ES20.10E3,ES20.10E3,&
&ES20.10E3,ES20.10E3,ES20.10E3)"

IF (Z == 10) THEN    ! Neon-like systems

   a=PROBA_OCC(TIME_COUNT,1)    ! N_1s
   a2=a**2
   b=1.D0-a
   b2=b**2
   c=PROBA_OCC(TIME_COUNT,2)    ! N_2s
   c2=c**2
   d=1.D0-c
   d2=d**2
   e=PROBA_OCC(TIME_COUNT,3)    ! N_2p0
   e2=e**2
   f=1.D0-e
   f2=f**2
   g=PROBA_OCC(TIME_COUNT,4)    ! N_2p1
   g2=g**2
   g3=g**3
   g4=g**4
   h=1.D0-g
   h2=h**2
   h3=h**3
   h4=h**4

IONIZ_PROBA(0)=a2*c2*e2*g4

IONIZ_PROBA(1)=2.D0*a*b*c2*e2*g4 + &
&2.D0*a2*c*d*e2*g4 + &
&2.D0*a2*c2*e*f*g4 + &
&4.D0*a2*c2*e2*g3*h

IONIZ_PROBA(2)=b2*c2*e2*g4 + &
&4.D0*a*b*c*d*e2*g4 + &
&a2*d2*e2*g4 + &
&4.D0*a*b*c2*e*f*g4 + &
&4.D0*a2*c*d*e*f*g4 + &
&a2*c2*f2*g4 + &
&8.D0*a*b*c2*e2*g3*h + &
&8.D0*a2*c*d*e2*g3*h + &
&8.D0*a2*c2*e*f*g3*h + &
&6.D0*a2*c2*e2*g2*h2

IONIZ_PROBA(3)=2.D0*b2*c*d*e2*g4 + &
&2.D0*a*b*d2*e2*g4 + &
&2.D0*b2*c2*e*f*g4 + &
&8.D0*a*b*c*d*e*f*g4 + &
&2.D0*a2*d2*e*f*g4 + &
&2.D0*a*b*c2*f2*g4 + &
&2.D0*a2*c*d*f2*g4 + &
&4.D0*b2*c2*e2*g3*h + &
&16.D0*a*b*c*d*e2*g3*h + &
&4.D0*a2*d2*e2*g3*h + &
&16.D0*a*b*c2*e*f*g3*h + &
&16.D0*a2*c*d*e*f*g3*h + &
&4.D0*a2*c2*f2*g3*h + &
&12.D0*a*b*c2*e2*g2*h2 + &
&12.D0*a2*c*d*e2*g2*h2 + &
&12.D0*a2*c2*e*f*g2*h2 + &
&4.D0*a2*c2*e2*g*h3

IONIZ_PROBA(4)=b2*d2*e2*g4 + &
&4.D0*b2*c*d*e*f*g4 + &
&4.D0*a*b*d2*e*f*g4 + &
&b2*c2*f2*g4 + &
&4.D0*a*b*c*d*f2*g4 + &
&a2*d2*f2*g4 + &
&8.D0*b2*c*d*e2*g3*h + &
&8.D0*a*b*d2*e2*g3*h + &
&8.D0*b2*c2*e*f*g3*h + &
&32.D0*a*b*c*d*e*f*g3*h + &
&8.D0*a2*d2*e*f*g3*h + &
&8.D0*a*b*c2*f2*g3*h + &
&8.D0*a2*c*d*f2*g3*h + &
&6.D0*b2*c2*e2*g2*h2 + &
&24.D0*a*b*c*d*e2*g2*h2 + &
&6.D0*a2*d2*e2*g2*h2 + &
&24.D0*a*b*c2*e*f*g2*h2 + &
&24.D0*a2*c*d*e*f*g2*h2 + &
&6.D0*a2*c2*f2*g2*h2 + &
&8.D0*a*b*c2*e2*g*h3 + &
&8.D0*a2*c*d*e2*g*h3 + &
&8.D0*a2*c2*e*f*g*h3 + &
&a2*c2*e2*h4

IONIZ_PROBA(5)=2.D0*b2*d2*e*f*g4 + &
&2.D0*b2*c*d*f2*g4 + &
&2.D0*a*b*d2*f2*g4 + &
&4.D0*b2*d2*e2*g3*h + &
&16.D0*b2*c*d*e*f*g3*h + &
&16.D0*a*b*d2*e*f*g3*h + &
&4.D0*b2*c2*f2*g3*h + &
&16.D0*a*b*c*d*f2*g3*h + &
&4.D0*a2*d2*f2*g3*h + &
&12.D0*b2*c*d*e2*g2*h2 + &
&12.D0*a*b*d2*e2*g2*h2 + &
&12.D0*b2*c2*e*f*g2*h2 + &
&48.D0*a*b*c*d*e*f*g2*h2 + &
&12.D0*a2*d2*e*f*g2*h2 + &
&12.D0*a*b*c2*f2*g2*h2 + &
&12.D0*a2*c*d*f2*g2*h2 + &
&4.D0*b2*c2*e2*g*h3 + &
&16.D0*a*b*c*d*e2*g*h3 + &
&4.D0*a2*d2*e2*g*h3 + &
&16.D0*a*b*c2*e*f*g*h3 + &
&16.D0*a2*c*d*e*f*g*h3 + &
&4.D0*a2*c2*f2*g*h3 + &
&2.D0*a*b*c2*e2*h4 + &
&2.D0*a2*c*d*e2*h4 + &
&2.D0*a2*c2*e*f*h4

IONIZ_PROBA(6)=b2*d2*f2*g4 + &
&8.D0*b2*d2*e*f*g3*h + &
&8.D0*b2*c*d*f2*g3*h + &
&8.D0*a*b*d2*f2*g3*h + &
&6.D0*b2*d2*e2*g2*h2 + &
&24.D0*b2*c*d*e*f*g2*h2 + &
&24.D0*a*b*d2*e*f*g2*h2 + &
&6.D0*b2*c2*f2*g2*h2 + &
&24.D0*a*b*c*d*f2*g2*h2 + &
&6.D0*a2*d2*f2*g2*h2 + &
&8.D0*b2*c*d*e2*g*h3 + &
&8.D0*a*b*d2*e2*g*h3 + &
&8.D0*b2*c2*e*f*g*h3 + &
&32.D0*a*b*c*d*e*f*g*h3 + &
&8.D0*a2*d2*e*f*g*h3 + &
&8.D0*a*b*c2*f2*g*h3 + &
&8.D0*a2*c*d*f2*g*h3 + &
&b2*c2*e2*h4 + &
&4.D0*a*b*c*d*e2*h4 + &
&a2*d2*e2*h4 + &
&4.D0*a*b*c2*e*f*h4 + &
&4.D0*a2*c*d*e*f*h4 + &
&a2*c2*f2*h4

IONIZ_PROBA(7)=4.D0*b2*d2*f2*g3*h + &
&12.D0*b2*d2*e*f*g2*h2 + &
&12.D0*b2*c*d*f2*g2*h2 + &
&12.D0*a*b*d2*f2*g2*h2 + &
&4.D0*b2*d2*e2*g*h3 + &
&16.D0*b2*c*d*e*f*g*h3 + &
&16.D0*a*b*d2*e*f*g*h3 + &
&4.D0*b2*c2*f2*g*h3 + &
&16.D0*a*b*c*d*f2*g*h3 + &
&4.D0*a2*d2*f2*g*h3 + &
&2.D0*b2*c*d*e2*h4 + &
&2.D0*a*b*d2*e2*h4 + &
&2.D0*b2*c2*e*f*h4 + &
&8.D0*a*b*c*d*e*f*h4 + &
&2.D0*a2*d2*e*f*h4 + &
&2.D0*a*b*c2*f2*h4 + &
&2.D0*a2*c*d*f2*h4

IONIZ_PROBA(8)=6.D0*b2*d2*f2*g2*h2 + &
&8.D0*b2*d2*e*f*g*h3 + &
&8.D0*b2*c*d*f2*g*h3 + &
&8.D0*a*b*d2*f2*g*h3 + &
&b2*d2*e2*h4 + &
&4.D0*b2*c*d*e*f*h4 + &
&4.D0*a*b*d2*e*f*h4 + &
&b2*c2*f2*h4 + &
&4.D0*a*b*c*d*f2*h4 + &
&a2*d2*f2*h4

IONIZ_PROBA(9)=4.D0*b2*d2*f2*g*h3 + &
&2.D0*b2*d2*e*f*h4 + &
&2.D0*b2*c*d*f2*h4 + &
&2.D0*a*b*d2*f2*h4

IONIZ_PROBA(10)=b2*d2*f2*h4

   IONIZATION=IONIZ_PROBA(0)+IONIZ_PROBA(1)+IONIZ_PROBA(2)+IONIZ_PROBA(3)+&
        &IONIZ_PROBA(4)+IONIZ_PROBA(5)+IONIZ_PROBA(6)+IONIZ_PROBA(7)+&
        &IONIZ_PROBA(8)+IONIZ_PROBA(9)+IONIZ_PROBA(10)

   OPEN(180,file='Ionization_Proba.dat',position='append')
   WRITE(180,FMT)t,IONIZ_PROBA(0),IONIZ_PROBA(1),IONIZ_PROBA(2),IONIZ_PROBA(3),&
        &IONIZ_PROBA(4),IONIZ_PROBA(5),IONIZ_PROBA(6),IONIZ_PROBA(7),&
        &IONIZ_PROBA(8),IONIZ_PROBA(9),IONIZ_PROBA(10)

   OPEN(190,file='Ionization.dat',position='append')
   WRITE(190,FMT)t,IONIZATION

ELSE IF(Z == 18) THEN    ! Argon-like systems

   a=PROBA_OCC(TIME_COUNT,1)    ! N_1s
   a2=a**2
   b=1.D0-a
   b2=b**2
   c=PROBA_OCC(TIME_COUNT,2)    ! N_2s
   c2=c**2
   d=1.D0-c
   d2=d**2
   e=PROBA_OCC(TIME_COUNT,4)    ! N_2p0
   e2=e**2
   f=1.D0-e
   f2=f**2
   g=PROBA_OCC(TIME_COUNT,6)    ! N_2p1
   g2=g**2
   g3=g**3
   g4=g**4
   h=1.D0-g
   h2=h**2
   h3=h**3
   h4=h**4
   i=PROBA_OCC(TIME_COUNT,3)    ! N_3s
   i2=i**2
   j=1.D0-i
   j2=j**2
   k=PROBA_OCC(TIME_COUNT,5)    ! N_3p0
   k2=k**2
   l=1.D0-k
   l2=l**2
   m=PROBA_OCC(TIME_COUNT,7)    ! N_3p1
   m2=m**2
   m3=m**3
   m4=m**4
   n=1.D0-m
   n2=n**2
   n3=n**3
   n4=n**4

IONIZ_PROBA(0)=a2*c2*e2*g4*i2*k2*m4

IONIZ_PROBA(1)=2.D0*a*b*c2*e2*g4*i2*k2*m4 + &
&2*a2*c*d*e2*g4*i2*k2*m4 + &
&2*a2*c2*e*f*g4*i2*k2*m4 + &
&4*a2*c2*e2*g3*h*i2*k2*m4 + &
&2*a2*c2*e2*g4*i*j*k2*m4 + &
&2*a2*c2*e2*g4*i2*k*l*m4 + &
&4*a2*c2*e2*g4*i2*k2*m3*n

IONIZ_PROBA(2)=b2*c2*e2*g4*i2*k2*m4 + &
&4.D0*a*b*c*d*e2*g4*i2*k2*m4 + &
&a2*d2*e2*g4*i2*k2*m4 + &
&4.D0*a*b*c2*e*f*g4*i2*k2*m4 + &
&4.D0*a2*c*d*e*f*g4*i2*k2*m4 + &
&a2*c2*f2*g4*i2*k2*m4 + &
&8.D0*a*b*c2*e2*g3*h*i2*k2*m4 + &
&8.D0*a2*c*d*e2*g3*h*i2*k2*m4 + &
&8.D0*a2*c2*e*f*g3*h*i2*k2*m4 + &
&6.D0*a2*c2*e2*g2*h2*i2*k2*m4 + &
&4.D0*a*b*c2*e2*g4*i*j*k2*m4 + &
&4.D0*a2*c*d*e2*g4*i*j*k2*m4 + &
&4.D0*a2*c2*e*f*g4*i*j*k2*m4 + &
&8.D0*a2*c2*e2*g3*h*i*j*k2*m4 + &
&a2*c2*e2*g4*j2*k2*m4 + &
&4.D0*a*b*c2*e2*g4*i2*k*l*m4 + &
&4.D0*a2*c*d*e2*g4*i2*k*l*m4 + &
&4.D0*a2*c2*e*f*g4*i2*k*l*m4 + &
&8.D0*a2*c2*e2*g3*h*i2*k*l*m4 + &
&4.D0*a2*c2*e2*g4*i*j*k*l*m4 + &
&a2*c2*e2*g4*i2*l2*m4 + &
&8.D0*a*b*c2*e2*g4*i2*k2*m3*n + &
&8.D0*a2*c*d*e2*g4*i2*k2*m3*n + &
&8.D0*a2*c2*e*f*g4*i2*k2*m3*n + &
&16.D0*a2*c2*e2*g3*h*i2*k2*m3*n + &
&8.D0*a2*c2*e2*g4*i*j*k2*m3*n + &
&8.D0*a2*c2*e2*g4*i2*k*l*m3*n + &
&6.D0*a2*c2*e2*g4*i2*k2*m2*n2

IONIZ_PROBA(3)=2.D0*b2*c*d*e2*g4*i2*k2*m4 +&
&2.D0*a*b*d2*e2*g4*i2*k2*m4 + &
&2.D0*b2*c2*e*f*g4*i2*k2*m4 + &
&8.D0*a*b*c*d*e*f*g4*i2*k2*m4 + &
&2.D0*a2*d2*e*f*g4*i2*k2*m4 + &
&2.D0*a*b*c2*f2*g4*i2*k2*m4 + &
&2.D0*a2*c*d*f2*g4*i2*k2*m4 + &
&4.D0*b2*c2*e2*g3*h*i2*k2*m4 + &
&16.D0*a*b*c*d*e2*g3*h*i2*k2*m4 + &
&4.D0*a2*d2*e2*g3*h*i2*k2*m4 + &
&16.D0*a*b*c2*e*f*g3*h*i2*k2*m4 + &
&16.D0*a2*c*d*e*f*g3*h*i2*k2*m4 + &
&4.D0*a2*c2*f2*g3*h*i2*k2*m4 + &
&12.D0*a*b*c2*e2*g2*h2*i2*k2*m4 + &
&12.D0*a2*c*d*e2*g2*h2*i2*k2*m4 + &
&12.D0*a2*c2*e*f*g2*h2*i2*k2*m4 + &
&4.D0*a2*c2*e2*g*h3*i2*k2*m4 + &
&2.D0*b2*c2*e2*g4*i*j*k2*m4 + &
&8.D0*a*b*c*d*e2*g4*i*j*k2*m4 + &
&2.D0*a2*d2*e2*g4*i*j*k2*m4 + &
&8.D0*a*b*c2*e*f*g4*i*j*k2*m4 + &
&8.D0*a2*c*d*e*f*g4*i*j*k2*m4 + &
&2.D0*a2*c2*f2*g4*i*j*k2*m4 + &
&16.D0*a*b*c2*e2*g3*h*i*j*k2*m4 + &
&16.D0*a2*c*d*e2*g3*h*i*j*k2*m4 + &
&16.D0*a2*c2*e*f*g3*h*i*j*k2*m4 + &
&12.D0*a2*c2*e2*g2*h2*i*j*k2*m4 + &
&2.D0*a*b*c2*e2*g4*j2*k2*m4 + &
&2.D0*a2*c*d*e2*g4*j2*k2*m4 + &
&2.D0*a2*c2*e*f*g4*j2*k2*m4 + &
&4.D0*a2*c2*e2*g3*h*j2*k2*m4 + &
&2.D0*b2*c2*e2*g4*i2*k*l*m4 + &
&8.D0*a*b*c*d*e2*g4*i2*k*l*m4 + &
&2.D0*a2*d2*e2*g4*i2*k*l*m4 + &
&8.D0*a*b*c2*e*f*g4*i2*k*l*m4 + &
&8.D0*a2*c*d*e*f*g4*i2*k*l*m4 + &
&2.D0*a2*c2*f2*g4*i2*k*l*m4 + &
&16.D0*a*b*c2*e2*g3*h*i2*k*l*m4 + &
&16.D0*a2*c*d*e2*g3*h*i2*k*l*m4 + &
&16.D0*a2*c2*e*f*g3*h*i2*k*l*m4 + &
&12.D0*a2*c2*e2*g2*h2*i2*k*l*m4 + &
&8.D0*a*b*c2*e2*g4*i*j*k*l*m4 + &
&8.D0*a2*c*d*e2*g4*i*j*k*l*m4 + &
&8.D0*a2*c2*e*f*g4*i*j*k*l*m4 + &
&16.D0*a2*c2*e2*g3*h*i*j*k*l*m4 + &
&2.D0*a2*c2*e2*g4*j2*k*l*m4 + &
&2.D0*a*b*c2*e2*g4*i2*l2*m4 + &
&2.D0*a2*c*d*e2*g4*i2*l2*m4 + &
&2.D0*a2*c2*e*f*g4*i2*l2*m4 + &
&4.D0*a2*c2*e2*g3*h*i2*l2*m4 + & 
&2.D0*a2*c2*e2*g4*i*j*l2*m4 + &
&4.D0*b2*c2*e2*g4*i2*k2*m3*n + &
&16.D0*a*b*c*d*e2*g4*i2*k2*m3*n + &
&4.D0*a2*d2*e2*g4*i2*k2*m3*n + &
&16.D0*a*b*c2*e*f*g4*i2*k2*m3*n + &
&16.D0*a2*c*d*e*f*g4*i2*k2*m3*n + &
&4.D0*a2*c2*f2*g4*i2*k2*m3*n + &
&32.D0*a*b*c2*e2*g3*h*i2*k2*m3*n + &
&32.D0*a2*c*d*e2*g3*h*i2*k2*m3*n + &
&32.D0*a2*c2*e*f*g3*h*i2*k2*m3*n + &
&24.D0*a2*c2*e2*g2*h2*i2*k2*m3*n + &
&16.D0*a*b*c2*e2*g4*i*j*k2*m3*n + &
&16.D0*a2*c*d*e2*g4*i*j*k2*m3*n + &
&16.D0*a2*c2*e*f*g4*i*j*k2*m3*n + &
&32.D0*a2*c2*e2*g3*h*i*j*k2*m3*n + &
&4.D0*a2*c2*e2*g4*j2*k2*m3*n + &
&16.D0*a*b*c2*e2*g4*i2*k*l*m3*n + &
&16.D0*a2*c*d*e2*g4*i2*k*l*m3*n + &
&16.D0*a2*c2*e*f*g4*i2*k*l*m3*n + &
&32.D0*a2*c2*e2*g3*h*i2*k*l*m3*n + &
&16.D0*a2*c2*e2*g4*i*j*k*l*m3*n + &
&4.D0*a2*c2*e2*g4*i2*l2*m3*n + &
&12.D0*a*b*c2*e2*g4*i2*k2*m2*n2 + &
&12.D0*a2*c*d*e2*g4*i2*k2*m2*n2 + &
&12.D0*a2*c2*e*f*g4*i2*k2*m2*n2 + &
&24.D0*a2*c2*e2*g3*h*i2*k2*m2*n2 + &
&12.D0*a2*c2*e2*g4*i*j*k2*m2*n2 + &
&12.D0*a2*c2*e2*g4*i2*k*l*m2*n2 + &
&4.D0*a2*c2*e2*g4*i2*k2*m*n3

IONIZ_PROBA(4)=b2*d2*e2*g4*i2*k2*m4 + &
&4.D0*b2*c*d*e*f*g4*i2*k2*m4 + &
&4.D0*a*b*d2*e*f*g4*i2*k2*m4 + &
&b2*c2*f2*g4*i2*k2*m4 + &
&4.D0*a*b*c*d*f2*g4*i2*k2*m4 + &
&a2*d2*f2*g4*i2*k2*m4 + &
&8.D0*b2*c*d*e2*g3*h*i2*k2*m4 + &
&8.D0*a*b*d2*e2*g3*h*i2*k2*m4 + &
&8.D0*b2*c2*e*f*g3*h*i2*k2*m4 + &
&32.D0*a*b*c*d*e*f*g3*h*i2*k2*m4 + &
&8.D0*a2*d2*e*f*g3*h*i2*k2*m4 + &
&8.D0*a*b*c2*f2*g3*h*i2*k2*m4 + &
&8.D0*a2*c*d*f2*g3*h*i2*k2*m4 + &
&6.D0*b2*c2*e2*g2*h2*i2*k2*m4 + &
&24.D0*a*b*c*d*e2*g2*h2*i2*k2*m4 + &
&6.D0*a2*d2*e2*g2*h2*i2*k2*m4 + &
&24.D0*a*b*c2*e*f*g2*h2*i2*k2*m4 + &
&24.D0*a2*c*d*e*f*g2*h2*i2*k2*m4 + &
&6.D0*a2*c2*f2*g2*h2*i2*k2*m4 + &
&8.D0*a*b*c2*e2*g*h3*i2*k2*m4 + &
&8.D0*a2*c*d*e2*g*h3*i2*k2*m4 + &
&8.D0*a2*c2*e*f*g*h3*i2*k2*m4 + &
&a2*c2*e2*h4*i2*k2*m4 + &
&4.D0*b2*c*d*e2*g4*i*j*k2*m4 + &
&4.D0*a*b*d2*e2*g4*i*j*k2*m4 + &
&4.D0*b2*c2*e*f*g4*i*j*k2*m4 + &
&16.D0*a*b*c*d*e*f*g4*i*j*k2*m4 + &
&4.D0*a2*d2*e*f*g4*i*j*k2*m4 + &
&4.D0*a*b*c2*f2*g4*i*j*k2*m4 + &
&4.D0*a2*c*d*f2*g4*i*j*k2*m4 + &
&8.D0*b2*c2*e2*g3*h*i*j*k2*m4 + &
&32.D0*a*b*c*d*e2*g3*h*i*j*k2*m4 + &
&8.D0*a2*d2*e2*g3*h*i*j*k2*m4 + &
&32.D0*a*b*c2*e*f*g3*h*i*j*k2*m4 + &
&32.D0*a2*c*d*e*f*g3*h*i*j*k2*m4 + &
&8.D0*a2*c2*f2*g3*h*i*j*k2*m4 + &
&24.D0*a*b*c2*e2*g2*h2*i*j*k2*m4 + &
&24.D0*a2*c*d*e2*g2*h2*i*j*k2*m4 + &
&24.D0*a2*c2*e*f*g2*h2*i*j*k2*m4 + &
&8.D0*a2*c2*e2*g*h3*i*j*k2*m4 + &
&b2*c2*e2*g4*j2*k2*m4 + &
&4.D0*a*b*c*d*e2*g4*j2*k2*m4 + &
&a2*d2*e2*g4*j2*k2*m4 + &
&4.D0*a*b*c2*e*f*g4*j2*k2*m4 + &
&4.D0*a2*c*d*e*f*g4*j2*k2*m4 + &
&a2*c2*f2*g4*j2*k2*m4 + &
&8.D0*a*b*c2*e2*g3*h*j2*k2*m4 + &
&8.D0*a2*c*d*e2*g3*h*j2*k2*m4 + &
&8.D0*a2*c2*e*f*g3*h*j2*k2*m4 + &
&6.D0*a2*c2*e2*g2*h2*j2*k2*m4 + &
&4.D0*b2*c*d*e2*g4*i2*k*l*m4 + &
&4.D0*a*b*d2*e2*g4*i2*k*l*m4 + &
&4.D0*b2*c2*e*f*g4*i2*k*l*m4 + &
&16.D0*a*b*c*d*e*f*g4*i2*k*l*m4 + &
&4.D0*a2*d2*e*f*g4*i2*k*l*m4 + &
&4.D0*a*b*c2*f2*g4*i2*k*l*m4 + &
&4.D0*a2*c*d*f2*g4*i2*k*l*m4 + &
&8.D0*b2*c2*e2*g3*h*i2*k*l*m4 + &
&32.D0*a*b*c*d*e2*g3*h*i2*k*l*m4 + &
&8.D0*a2*d2*e2*g3*h*i2*k*l*m4 + &
&32.D0*a*b*c2*e*f*g3*h*i2*k*l*m4 + &
&32.D0*a2*c*d*e*f*g3*h*i2*k*l*m4 + &
&8.D0*a2*c2*f2*g3*h*i2*k*l*m4 + &
&24.D0*a*b*c2*e2*g2*h2*i2*k*l*m4 + &
&24.D0*a2*c*d*e2*g2*h2*i2*k*l*m4 + &
&24.D0*a2*c2*e*f*g2*h2*i2*k*l*m4 + &
&8.D0*a2*c2*e2*g*h3*i2*k*l*m4 + &
&4.D0*b2*c2*e2*g4*i*j*k*l*m4 + &
&16.D0*a*b*c*d*e2*g4*i*j*k*l*m4 + &
&4.D0*a2*d2*e2*g4*i*j*k*l*m4 + &
&16.D0*a*b*c2*e*f*g4*i*j*k*l*m4 + &
&16.D0*a2*c*d*e*f*g4*i*j*k*l*m4 + &
&4.D0*a2*c2*f2*g4*i*j*k*l*m4 + &
&32.D0*a*b*c2*e2*g3*h*i*j*k*l*m4 + &
&32.D0*a2*c*d*e2*g3*h*i*j*k*l*m4 + &
&32.D0*a2*c2*e*f*g3*h*i*j*k*l*m4 + &
&24.D0*a2*c2*e2*g2*h2*i*j*k*l*m4 + &
&4.D0*a*b*c2*e2*g4*j2*k*l*m4 + &
&4.D0*a2*c*d*e2*g4*j2*k*l*m4 + &
&4.D0*a2*c2*e*f*g4*j2*k*l*m4 + &
&8.D0*a2*c2*e2*g3*h*j2*k*l*m4 + &
&b2*c2*e2*g4*i2*l2*m4 + &
&4.D0*a*b*c*d*e2*g4*i2*l2*m4 + &
&a2*d2*e2*g4*i2*l2*m4 + &
&4.D0*a*b*c2*e*f*g4*i2*l2*m4 + &
&4.D0*a2*c*d*e*f*g4*i2*l2*m4 + &
&a2*c2*f2*g4*i2*l2*m4 + &
&8.D0*a*b*c2*e2*g3*h*i2*l2*m4 + &
&8.D0*a2*c*d*e2*g3*h*i2*l2*m4 + &
&8.D0*a2*c2*e*f*g3*h*i2*l2*m4 + &
&6.D0*a2*c2*e2*g2*h2*i2*l2*m4 + &
&4.D0*a*b*c2*e2*g4*i*j*l2*m4 + &
&4.D0*a2*c*d*e2*g4*i*j*l2*m4 + &
&4.D0*a2*c2*e*f*g4*i*j*l2*m4 + &
&8.D0*a2*c2*e2*g3*h*i*j*l2*m4 + &
&a2*c2*e2*g4*j2*l2*m4 + &
&8.D0*b2*c*d*e2*g4*i2*k2*m3*n + &
&8.D0*a*b*d2*e2*g4*i2*k2*m3*n + &
&8.D0*b2*c2*e*f*g4*i2*k2*m3*n + &
&32.D0*a*b*c*d*e*f*g4*i2*k2*m3*n + &
&8.D0*a2*d2*e*f*g4*i2*k2*m3*n + &
&8.D0*a*b*c2*f2*g4*i2*k2*m3*n + & 
&8.D0*a2*c*d*f2*g4*i2*k2*m3*n + &
&16.D0*b2*c2*e2*g3*h*i2*k2*m3*n + &
&64.D0*a*b*c*d*e2*g3*h*i2*k2*m3*n + &
&16.D0*a2*d2*e2*g3*h*i2*k2*m3*n + &
&64.D0*a*b*c2*e*f*g3*h*i2*k2*m3*n + &
&64.D0*a2*c*d*e*f*g3*h*i2*k2*m3*n + &
&16.D0*a2*c2*f2*g3*h*i2*k2*m3*n + &
&48.D0*a*b*c2*e2*g2*h2*i2*k2*m3*n + &
&48.D0*a2*c*d*e2*g2*h2*i2*k2*m3*n + &
&48.D0*a2*c2*e*f*g2*h2*i2*k2*m3*n + &
&16.D0*a2*c2*e2*g*h3*i2*k2*m3*n + &
&8.D0*b2*c2*e2*g4*i*j*k2*m3*n + &
&32.D0*a*b*c*d*e2*g4*i*j*k2*m3*n + &
&8.D0*a2*d2*e2*g4*i*j*k2*m3*n + &
&32.D0*a*b*c2*e*f*g4*i*j*k2*m3*n + &
&32.D0*a2*c*d*e*f*g4*i*j*k2*m3*n + &
&8.D0*a2*c2*f2*g4*i*j*k2*m3*n + &
&64.D0*a*b*c2*e2*g3*h*i*j*k2*m3*n + &
&64.D0*a2*c*d*e2*g3*h*i*j*k2*m3*n + &
&64.D0*a2*c2*e*f*g3*h*i*j*k2*m3*n + &
&48.D0*a2*c2*e2*g2*h2*i*j*k2*m3*n + &
&8.D0*a*b*c2*e2*g4*j2*k2*m3*n + &
&8.D0*a2*c*d*e2*g4*j2*k2*m3*n + &
&8.D0*a2*c2*e*f*g4*j2*k2*m3*n + &
&16.D0*a2*c2*e2*g3*h*j2*k2*m3*n + &
&8.D0*b2*c2*e2*g4*i2*k*l*m3*n + &
&32.D0*a*b*c*d*e2*g4*i2*k*l*m3*n + &
&8.D0*a2*d2*e2*g4*i2*k*l*m3*n + &
&32.D0*a*b*c2*e*f*g4*i2*k*l*m3*n + &
&32.D0*a2*c*d*e*f*g4*i2*k*l*m3*n + &
&8.D0*a2*c2*f2*g4*i2*k*l*m3*n + &
&64.D0*a*b*c2*e2*g3*h*i2*k*l*m3*n + &
&64.D0*a2*c*d*e2*g3*h*i2*k*l*m3*n + &
&64.D0*a2*c2*e*f*g3*h*i2*k*l*m3*n + &
&48.D0*a2*c2*e2*g2*h2*i2*k*l*m3*n + &
&32.D0*a*b*c2*e2*g4*i*j*k*l*m3*n + &
&32.D0*a2*c*d*e2*g4*i*j*k*l*m3*n + &
&32.D0*a2*c2*e*f*g4*i*j*k*l*m3*n + &
&64.D0*a2*c2*e2*g3*h*i*j*k*l*m3*n + &
&8.D0*a2*c2*e2*g4*j2*k*l*m3*n + &
&8.D0*a*b*c2*e2*g4*i2*l2*m3*n + &
&8.D0*a2*c*d*e2*g4*i2*l2*m3*n + &
&8.D0*a2*c2*e*f*g4*i2*l2*m3*n + &
&16.D0*a2*c2*e2*g3*h*i2*l2*m3*n + &
&8.D0*a2*c2*e2*g4*i*j*l2*m3*n + &
&6.D0*b2*c2*e2*g4*i2*k2*m2*n2 + &
&24.D0*a*b*c*d*e2*g4*i2*k2*m2*n2 + &
&6.D0*a2*d2*e2*g4*i2*k2*m2*n2 + &
&24.D0*a*b*c2*e*f*g4*i2*k2*m2*n2 + &
&24.D0*a2*c*d*e*f*g4*i2*k2*m2*n2 + &
&6.D0*a2*c2*f2*g4*i2*k2*m2*n2 + &
&48.D0*a*b*c2*e2*g3*h*i2*k2*m2*n2 + &
&48.D0*a2*c*d*e2*g3*h*i2*k2*m2*n2 + &
&48.D0*a2*c2*e*f*g3*h*i2*k2*m2*n2 + &
&36.D0*a2*c2*e2*g2*h2*i2*k2*m2*n2 + &
&24.D0*a*b*c2*e2*g4*i*j*k2*m2*n2 + &
&24.D0*a2*c*d*e2*g4*i*j*k2*m2*n2 + &
&24.D0*a2*c2*e*f*g4*i*j*k2*m2*n2 + &
&48.D0*a2*c2*e2*g3*h*i*j*k2*m2*n2 + &
&6.D0*a2*c2*e2*g4*j2*k2*m2*n2 + &
&24.D0*a*b*c2*e2*g4*i2*k*l*m2*n2 + &
&24.D0*a2*c*d*e2*g4*i2*k*l*m2*n2 + &
&24.D0*a2*c2*e*f*g4*i2*k*l*m2*n2 + &
&48.D0*a2*c2*e2*g3*h*i2*k*l*m2*n2 + &
&24.D0*a2*c2*e2*g4*i*j*k*l*m2*n2 + &
&6.D0*a2*c2*e2*g4*i2*l2*m2*n2 + &
&8.D0*a*b*c2*e2*g4*i2*k2*m*n3 + &
&8.D0*a2*c*d*e2*g4*i2*k2*m*n3 + &
&8.D0*a2*c2*e*f*g4*i2*k2*m*n3 + &
&16.D0*a2*c2*e2*g3*h*i2*k2*m*n3 + &
&8.D0*a2*c2*e2*g4*i*j*k2*m*n3 + &
&8.D0*a2*c2*e2*g4*i2*k*l*m*n3 + &
&a2*c2*e2*g4*i2*k2*n4

IONIZ_PROBA(5)=2.D0*b2*d2*e*f*g4*i2*k2*m4 + &
&2.D0*b2*c*d*f2*g4*i2*k2*m4 + &
&2.D0*a*b*d2*f2*g4*i2*k2*m4 + &
&4.D0*b2*d2*e2*g3*h*i2*k2*m4 + &
&16.D0*b2*c*d*e*f*g3*h*i2*k2*m4 + &
&16.D0*a*b*d2*e*f*g3*h*i2*k2*m4 + &
&4.D0*b2*c2*f2*g3*h*i2*k2*m4 + &
&16.D0*a*b*c*d*f2*g3*h*i2*k2*m4 + &
&4.D0*a2*d2*f2*g3*h*i2*k2*m4 + &
&12.D0*b2*c*d*e2*g2*h2*i2*k2*m4 + &
&12.D0*a*b*d2*e2*g2*h2*i2*k2*m4 + &
&12.D0*b2*c2*e*f*g2*h2*i2*k2*m4 + &
&48.D0*a*b*c*d*e*f*g2*h2*i2*k2*m4 + &
&12.D0*a2*d2*e*f*g2*h2*i2*k2*m4 + &
&12.D0*a*b*c2*f2*g2*h2*i2*k2*m4 + &
&12.D0*a2*c*d*f2*g2*h2*i2*k2*m4 + &
&4.D0*b2*c2*e2*g*h3*i2*k2*m4 + &
&16.D0*a*b*c*d*e2*g*h3*i2*k2*m4 + &
&4.D0*a2*d2*e2*g*h3*i2*k2*m4 + &
&16.D0*a*b*c2*e*f*g*h3*i2*k2*m4 + &
&16.D0*a2*c*d*e*f*g*h3*i2*k2*m4 + &
&4.D0*a2*c2*f2*g*h3*i2*k2*m4 + &
&2.D0*a*b*c2*e2*h4*i2*k2*m4 + &
&2.D0*a2*c*d*e2*h4*i2*k2*m4 + &
&2.D0*a2*c2*e*f*h4*i2*k2*m4 + &
&2.D0*b2*d2*e2*g4*i*j*k2*m4 + &
&8.D0*b2*c*d*e*f*g4*i*j*k2*m4 + &
&8.D0*a*b*d2*e*f*g4*i*j*k2*m4 + &
&2.D0*b2*c2*f2*g4*i*j*k2*m4 + &
&8.D0*a*b*c*d*f2*g4*i*j*k2*m4 + &
&2.D0*a2*d2*f2*g4*i*j*k2*m4 + &
&16.D0*b2*c*d*e2*g3*h*i*j*k2*m4 + &
&16.D0*a*b*d2*e2*g3*h*i*j*k2*m4 + &
&16.D0*b2*c2*e*f*g3*h*i*j*k2*m4 + &
&64.D0*a*b*c*d*e*f*g3*h*i*j*k2*m4 + &
&16.D0*a2*d2*e*f*g3*h*i*j*k2*m4 + &
&16.D0*a*b*c2*f2*g3*h*i*j*k2*m4 + &
&16.D0*a2*c*d*f2*g3*h*i*j*k2*m4 + &
&12.D0*b2*c2*e2*g2*h2*i*j*k2*m4 + &
&48.D0*a*b*c*d*e2*g2*h2*i*j*k2*m4 + &
&12.D0*a2*d2*e2*g2*h2*i*j*k2*m4 + &
&48.D0*a*b*c2*e*f*g2*h2*i*j*k2*m4 + &
&48.D0*a2*c*d*e*f*g2*h2*i*j*k2*m4 + &
&12.D0*a2*c2*f2*g2*h2*i*j*k2*m4 + &
&16.D0*a*b*c2*e2*g*h3*i*j*k2*m4 + &
&16.D0*a2*c*d*e2*g*h3*i*j*k2*m4 + &
&16.D0*a2*c2*e*f*g*h3*i*j*k2*m4 + &
&2.D0*a2*c2*e2*h4*i*j*k2*m4 + &
&2.D0*b2*c*d*e2*g4*j2*k2*m4 + &
&2.D0*a*b*d2*e2*g4*j2*k2*m4 + &
&2.D0*b2*c2*e*f*g4*j2*k2*m4 + &
&8.D0*a*b*c*d*e*f*g4*j2*k2*m4 + &
&2.D0*a2*d2*e*f*g4*j2*k2*m4 + &
&2.D0*a*b*c2*f2*g4*j2*k2*m4 + &
&2.D0*a2*c*d*f2*g4*j2*k2*m4 + &
&4.D0*b2*c2*e2*g3*h*j2*k2*m4 + &
&16.D0*a*b*c*d*e2*g3*h*j2*k2*m4 + &
&4.D0*a2*d2*e2*g3*h*j2*k2*m4 + &
&16.D0*a*b*c2*e*f*g3*h*j2*k2*m4 + &
&16.D0*a2*c*d*e*f*g3*h*j2*k2*m4 + &
&4.D0*a2*c2*f2*g3*h*j2*k2*m4 + &
&12.D0*a*b*c2*e2*g2*h2*j2*k2*m4 + &
&12.D0*a2*c*d*e2*g2*h2*j2*k2*m4 + &
&12.D0*a2*c2*e*f*g2*h2*j2*k2*m4 + &
&4.D0*a2*c2*e2*g*h3*j2*k2*m4 + &
&2.D0*b2*d2*e2*g4*i2*k*l*m4 + &
&8.D0*b2*c*d*e*f*g4*i2*k*l*m4 + &
&8.D0*a*b*d2*e*f*g4*i2*k*l*m4 + &
&2.D0*b2*c2*f2*g4*i2*k*l*m4 + &
&8.D0*a*b*c*d*f2*g4*i2*k*l*m4 + &
&2.D0*a2*d2*f2*g4*i2*k*l*m4 + &
&16.D0*b2*c*d*e2*g3*h*i2*k*l*m4 + &
&16.D0*a*b*d2*e2*g3*h*i2*k*l*m4 + &
&16.D0*b2*c2*e*f*g3*h*i2*k*l*m4 + &
&64.D0*a*b*c*d*e*f*g3*h*i2*k*l*m4 + &
&16.D0*a2*d2*e*f*g3*h*i2*k*l*m4 + &
&16.D0*a*b*c2*f2*g3*h*i2*k*l*m4 + &
&16.D0*a2*c*d*f2*g3*h*i2*k*l*m4 + &
&12.D0*b2*c2*e2*g2*h2*i2*k*l*m4 + &
&48.D0*a*b*c*d*e2*g2*h2*i2*k*l*m4 + &
&12.D0*a2*d2*e2*g2*h2*i2*k*l*m4 + &
&48.D0*a*b*c2*e*f*g2*h2*i2*k*l*m4 + &
&48.D0*a2*c*d*e*f*g2*h2*i2*k*l*m4 + &
&12.D0*a2*c2*f2*g2*h2*i2*k*l*m4 + &
&16.D0*a*b*c2*e2*g*h3*i2*k*l*m4 + &
&16.D0*a2*c*d*e2*g*h3*i2*k*l*m4 + &
&16.D0*a2*c2*e*f*g*h3*i2*k*l*m4 + &
&2.D0*a2*c2*e2*h4*i2*k*l*m4 + &
&8.D0*b2*c*d*e2*g4*i*j*k*l*m4 + &
&8.D0*a*b*d2*e2*g4*i*j*k*l*m4 + &
&8.D0*b2*c2*e*f*g4*i*j*k*l*m4 + &
&32.D0*a*b*c*d*e*f*g4*i*j*k*l*m4 + &
&8.D0*a2*d2*e*f*g4*i*j*k*l*m4 + &
&8.D0*a*b*c2*f2*g4*i*j*k*l*m4 + &
&8.D0*a2*c*d*f2*g4*i*j*k*l*m4 + &
&16.D0*b2*c2*e2*g3*h*i*j*k*l*m4 + &
&64.D0*a*b*c*d*e2*g3*h*i*j*k*l*m4 + &
&16.D0*a2*d2*e2*g3*h*i*j*k*l*m4 + &
&64.D0*a*b*c2*e*f*g3*h*i*j*k*l*m4 + &
&64.D0*a2*c*d*e*f*g3*h*i*j*k*l*m4 + &
&16.D0*a2*c2*f2*g3*h*i*j*k*l*m4 + &
&48.D0*a*b*c2*e2*g2*h2*i*j*k*l*m4 + &
&48.D0*a2*c*d*e2*g2*h2*i*j*k*l*m4 + &
&48.D0*a2*c2*e*f*g2*h2*i*j*k*l*m4 + &
&16.D0*a2*c2*e2*g*h3*i*j*k*l*m4 + &
&2.D0*b2*c2*e2*g4*j2*k*l*m4 + &
&8.D0*a*b*c*d*e2*g4*j2*k*l*m4 + &
&2.D0*a2*d2*e2*g4*j2*k*l*m4 + &
&8.D0*a*b*c2*e*f*g4*j2*k*l*m4 + &
&8.D0*a2*c*d*e*f*g4*j2*k*l*m4 + &
&2.D0*a2*c2*f2*g4*j2*k*l*m4 + &
&16.D0*a*b*c2*e2*g3*h*j2*k*l*m4 + &
&16.D0*a2*c*d*e2*g3*h*j2*k*l*m4 + &
&16.D0*a2*c2*e*f*g3*h*j2*k*l*m4 + &
&12.D0*a2*c2*e2*g2*h2*j2*k*l*m4 + &
&2.D0*b2*c*d*e2*g4*i2*l2*m4 + &
&2.D0*a*b*d2*e2*g4*i2*l2*m4 + &
&2.D0*b2*c2*e*f*g4*i2*l2*m4 + &
&8.D0*a*b*c*d*e*f*g4*i2*l2*m4 + &
&2.D0*a2*d2*e*f*g4*i2*l2*m4 + &
&2.D0*a*b*c2*f2*g4*i2*l2*m4 + &
&2.D0*a2*c*d*f2*g4*i2*l2*m4 + &
&4.D0*b2*c2*e2*g3*h*i2*l2*m4 + &
&16.D0*a*b*c*d*e2*g3*h*i2*l2*m4 + &
&4.D0*a2*d2*e2*g3*h*i2*l2*m4 + &
&16.D0*a*b*c2*e*f*g3*h*i2*l2*m4 + &
&16.D0*a2*c*d*e*f*g3*h*i2*l2*m4 + &
&4.D0*a2*c2*f2*g3*h*i2*l2*m4 + &
&12.D0*a*b*c2*e2*g2*h2*i2*l2*m4 + &
&12.D0*a2*c*d*e2*g2*h2*i2*l2*m4 + &
&12.D0*a2*c2*e*f*g2*h2*i2*l2*m4 + &
&4.D0*a2*c2*e2*g*h3*i2*l2*m4 + &
&2.D0*b2*c2*e2*g4*i*j*l2*m4 + &
&8.D0*a*b*c*d*e2*g4*i*j*l2*m4 + &
&2.D0*a2*d2*e2*g4*i*j*l2*m4 + &
&8.D0*a*b*c2*e*f*g4*i*j*l2*m4 + &
&8.D0*a2*c*d*e*f*g4*i*j*l2*m4 + &
&2.D0*a2*c2*f2*g4*i*j*l2*m4 + &
&16.D0*a*b*c2*e2*g3*h*i*j*l2*m4 + &
&16.D0*a2*c*d*e2*g3*h*i*j*l2*m4 + &
&16.D0*a2*c2*e*f*g3*h*i*j*l2*m4 + &
&12.D0*a2*c2*e2*g2*h2*i*j*l2*m4 + &
&2.D0*a*b*c2*e2*g4*j2*l2*m4 + &
&2.D0*a2*c*d*e2*g4*j2*l2*m4 + &
&2.D0*a2*c2*e*f*g4*j2*l2*m4 + &
&4.D0*a2*c2*e2*g3*h*j2*l2*m4 + &
&4.D0*b2*d2*e2*g4*i2*k2*m3*n + &
&16.D0*b2*c*d*e*f*g4*i2*k2*m3*n + &
&16.D0*a*b*d2*e*f*g4*i2*k2*m3*n + &
&4.D0*b2*c2*f2*g4*i2*k2*m3*n + &
&16.D0*a*b*c*d*f2*g4*i2*k2*m3*n + &
&4.D0*a2*d2*f2*g4*i2*k2*m3*n + &
&32.D0*b2*c*d*e2*g3*h*i2*k2*m3*n + &
&32.D0*a*b*d2*e2*g3*h*i2*k2*m3*n + &
&32.D0*b2*c2*e*f*g3*h*i2*k2*m3*n + &
&128.D0*a*b*c*d*e*f*g3*h*i2*k2*m3*n + &
&32.D0*a2*d2*e*f*g3*h*i2*k2*m3*n + &
&32.D0*a*b*c2*f2*g3*h*i2*k2*m3*n + &
&32.D0*a2*c*d*f2*g3*h*i2*k2*m3*n + &
&24.D0*b2*c2*e2*g2*h2*i2*k2*m3*n + &
&96.D0*a*b*c*d*e2*g2*h2*i2*k2*m3*n + &
&24.D0*a2*d2*e2*g2*h2*i2*k2*m3*n + &
&96.D0*a*b*c2*e*f*g2*h2*i2*k2*m3*n + &
&96.D0*a2*c*d*e*f*g2*h2*i2*k2*m3*n + &
&24.D0*a2*c2*f2*g2*h2*i2*k2*m3*n + &
&32.D0*a*b*c2*e2*g*h3*i2*k2*m3*n + &
&32.D0*a2*c*d*e2*g*h3*i2*k2*m3*n + &
&32.D0*a2*c2*e*f*g*h3*i2*k2*m3*n + &
&4.D0*a2*c2*e2*h4*i2*k2*m3*n + &
&16.D0*b2*c*d*e2*g4*i*j*k2*m3*n + &
&16.D0*a*b*d2*e2*g4*i*j*k2*m3*n + &
&16.D0*b2*c2*e*f*g4*i*j*k2*m3*n + &
&64.D0*a*b*c*d*e*f*g4*i*j*k2*m3*n + &
&16.D0*a2*d2*e*f*g4*i*j*k2*m3*n + &
&16.D0*a*b*c2*f2*g4*i*j*k2*m3*n + &
&16.D0*a2*c*d*f2*g4*i*j*k2*m3*n + &
&32.D0*b2*c2*e2*g3*h*i*j*k2*m3*n + &
&128.D0*a*b*c*d*e2*g3*h*i*j*k2*m3*n + &
&32.D0*a2*d2*e2*g3*h*i*j*k2*m3*n + &
&128.D0*a*b*c2*e*f*g3*h*i*j*k2*m3*n + &
&128.D0*a2*c*d*e*f*g3*h*i*j*k2*m3*n + &
&32.D0*a2*c2*f2*g3*h*i*j*k2*m3*n + &
&96.D0*a*b*c2*e2*g2*h2*i*j*k2*m3*n + &
&96.D0*a2*c*d*e2*g2*h2*i*j*k2*m3*n + &
&96.D0*a2*c2*e*f*g2*h2*i*j*k2*m3*n + &
&32.D0*a2*c2*e2*g*h3*i*j*k2*m3*n + &
&4.D0*b2*c2*e2*g4*j2*k2*m3*n + &
&16.D0*a*b*c*d*e2*g4*j2*k2*m3*n + &
&4.D0*a2*d2*e2*g4*j2*k2*m3*n + &
&16.D0*a*b*c2*e*f*g4*j2*k2*m3*n + &
&16.D0*a2*c*d*e*f*g4*j2*k2*m3*n + &
&4.D0*a2*c2*f2*g4*j2*k2*m3*n + &
&32.D0*a*b*c2*e2*g3*h*j2*k2*m3*n + &
&32.D0*a2*c*d*e2*g3*h*j2*k2*m3*n + &
&32.D0*a2*c2*e*f*g3*h*j2*k2*m3*n + &
&24.D0*a2*c2*e2*g2*h2*j2*k2*m3*n + &
&16.D0*b2*c*d*e2*g4*i2*k*l*m3*n + &
&16.D0*a*b*d2*e2*g4*i2*k*l*m3*n + &
&16.D0*b2*c2*e*f*g4*i2*k*l*m3*n + &
&64.D0*a*b*c*d*e*f*g4*i2*k*l*m3*n + &
&16.D0*a2*d2*e*f*g4*i2*k*l*m3*n + &
&16.D0*a*b*c2*f2*g4*i2*k*l*m3*n + &
&16.D0*a2*c*d*f2*g4*i2*k*l*m3*n + &
&32.D0*b2*c2*e2*g3*h*i2*k*l*m3*n + &
&128.D0*a*b*c*d*e2*g3*h*i2*k*l*m3*n + &
&32.D0*a2*d2*e2*g3*h*i2*k*l*m3*n + &
&128.D0*a*b*c2*e*f*g3*h*i2*k*l*m3*n + &
&128.D0*a2*c*d*e*f*g3*h*i2*k*l*m3*n + &
&32.D0*a2*c2*f2*g3*h*i2*k*l*m3*n + &
&96.D0*a*b*c2*e2*g2*h2*i2*k*l*m3*n + &
&96.D0*a2*c*d*e2*g2*h2*i2*k*l*m3*n + &
&96.D0*a2*c2*e*f*g2*h2*i2*k*l*m3*n + &
&32.D0*a2*c2*e2*g*h3*i2*k*l*m3*n + &
&16.D0*b2*c2*e2*g4*i*j*k*l*m3*n + &
&64.D0*a*b*c*d*e2*g4*i*j*k*l*m3*n + &
&16.D0*a2*d2*e2*g4*i*j*k*l*m3*n + &
&64.D0*a*b*c2*e*f*g4*i*j*k*l*m3*n + &
&64.D0*a2*c*d*e*f*g4*i*j*k*l*m3*n + &
&16.D0*a2*c2*f2*g4*i*j*k*l*m3*n + &
&128.D0*a*b*c2*e2*g3*h*i*j*k*l*m3*n + &
&128.D0*a2*c*d*e2*g3*h*i*j*k*l*m3*n + &
&128.D0*a2*c2*e*f*g3*h*i*j*k*l*m3*n + &
&96.D0*a2*c2*e2*g2*h2*i*j*k*l*m3*n + &
&16.D0*a*b*c2*e2*g4*j2*k*l*m3*n + &
&16.D0*a2*c*d*e2*g4*j2*k*l*m3*n + &
&16.D0*a2*c2*e*f*g4*j2*k*l*m3*n + &
&32.D0*a2*c2*e2*g3*h*j2*k*l*m3*n + &
&4.D0*b2*c2*e2*g4*i2*l2*m3*n + &
&16.D0*a*b*c*d*e2*g4*i2*l2*m3*n + &
&4.D0*a2*d2*e2*g4*i2*l2*m3*n + &
&16.D0*a*b*c2*e*f*g4*i2*l2*m3*n + &
&16.D0*a2*c*d*e*f*g4*i2*l2*m3*n + &
&4.D0*a2*c2*f2*g4*i2*l2*m3*n + &
&32.D0*a*b*c2*e2*g3*h*i2*l2*m3*n + &
&32.D0*a2*c*d*e2*g3*h*i2*l2*m3*n + &
&32.D0*a2*c2*e*f*g3*h*i2*l2*m3*n + &
&24.D0*a2*c2*e2*g2*h2*i2*l2*m3*n + &
&16.D0*a*b*c2*e2*g4*i*j*l2*m3*n + &
&16.D0*a2*c*d*e2*g4*i*j*l2*m3*n + &
&16.D0*a2*c2*e*f*g4*i*j*l2*m3*n + &
&32.D0*a2*c2*e2*g3*h*i*j*l2*m3*n + &
&4.D0*a2*c2*e2*g4*j2*l2*m3*n + &
&12.D0*b2*c*d*e2*g4*i2*k2*m2*n2 + &
&12.D0*a*b*d2*e2*g4*i2*k2*m2*n2 + &
&12.D0*b2*c2*e*f*g4*i2*k2*m2*n2 + &
&48.D0*a*b*c*d*e*f*g4*i2*k2*m2*n2 + &
&12.D0*a2*d2*e*f*g4*i2*k2*m2*n2 + &
&12.D0*a*b*c2*f2*g4*i2*k2*m2*n2 + &
&12.D0*a2*c*d*f2*g4*i2*k2*m2*n2 + &
&24.D0*b2*c2*e2*g3*h*i2*k2*m2*n2 + &
&96.D0*a*b*c*d*e2*g3*h*i2*k2*m2*n2 + &
&24.D0*a2*d2*e2*g3*h*i2*k2*m2*n2 + &
&96.D0*a*b*c2*e*f*g3*h*i2*k2*m2*n2 + &
&96.D0*a2*c*d*e*f*g3*h*i2*k2*m2*n2 + &
&24.D0*a2*c2*f2*g3*h*i2*k2*m2*n2 + &
&72.D0*a*b*c2*e2*g2*h2*i2*k2*m2*n2 + &
&72.D0*a2*c*d*e2*g2*h2*i2*k2*m2*n2 + &
&72.D0*a2*c2*e*f*g2*h2*i2*k2*m2*n2 + &
&24.D0*a2*c2*e2*g*h3*i2*k2*m2*n2 + &
&12.D0*b2*c2*e2*g4*i*j*k2*m2*n2 + &
&48.D0*a*b*c*d*e2*g4*i*j*k2*m2*n2 + &
&12.D0*a2*d2*e2*g4*i*j*k2*m2*n2 + &
&48.D0*a*b*c2*e*f*g4*i*j*k2*m2*n2 + &
&48.D0*a2*c*d*e*f*g4*i*j*k2*m2*n2 + &
&12.D0*a2*c2*f2*g4*i*j*k2*m2*n2 + &
&96.D0*a*b*c2*e2*g3*h*i*j*k2*m2*n2 + &
&96.D0*a2*c*d*e2*g3*h*i*j*k2*m2*n2 + &
&96.D0*a2*c2*e*f*g3*h*i*j*k2*m2*n2 + &
&72.D0*a2*c2*e2*g2*h2*i*j*k2*m2*n2 + &
&12.D0*a*b*c2*e2*g4*j2*k2*m2*n2 + &
&12.D0*a2*c*d*e2*g4*j2*k2*m2*n2 + &
&12.D0*a2*c2*e*f*g4*j2*k2*m2*n2 + &
&24.D0*a2*c2*e2*g3*h*j2*k2*m2*n2 + &
&12.D0*b2*c2*e2*g4*i2*k*l*m2*n2 + &
&48.D0*a*b*c*d*e2*g4*i2*k*l*m2*n2 + &
&12.D0*a2*d2*e2*g4*i2*k*l*m2*n2 + &
&48.D0*a*b*c2*e*f*g4*i2*k*l*m2*n2 + &
&48.D0*a2*c*d*e*f*g4*i2*k*l*m2*n2 + &
&12.D0*a2*c2*f2*g4*i2*k*l*m2*n2 + &
&96.D0*a*b*c2*e2*g3*h*i2*k*l*m2*n2 + &
&96.D0*a2*c*d*e2*g3*h*i2*k*l*m2*n2 + &
&96.D0*a2*c2*e*f*g3*h*i2*k*l*m2*n2 + &
&72.D0*a2*c2*e2*g2*h2*i2*k*l*m2*n2 + &
&48.D0*a*b*c2*e2*g4*i*j*k*l*m2*n2 + &
&48.D0*a2*c*d*e2*g4*i*j*k*l*m2*n2 + &
&48.D0*a2*c2*e*f*g4*i*j*k*l*m2*n2 + &
&96.D0*a2*c2*e2*g3*h*i*j*k*l*m2*n2 + &
&12.D0*a2*c2*e2*g4*j2*k*l*m2*n2 + &
&12.D0*a*b*c2*e2*g4*i2*l2*m2*n2 + &
&12.D0*a2*c*d*e2*g4*i2*l2*m2*n2 + &
&12.D0*a2*c2*e*f*g4*i2*l2*m2*n2 + &
&24.D0*a2*c2*e2*g3*h*i2*l2*m2*n2 + &
&12.D0*a2*c2*e2*g4*i*j*l2*m2*n2 + &
&4.D0*b2*c2*e2*g4*i2*k2*m*n3 + &
&16.D0*a*b*c*d*e2*g4*i2*k2*m*n3 + &
&4.D0*a2*d2*e2*g4*i2*k2*m*n3 + &
&16.D0*a*b*c2*e*f*g4*i2*k2*m*n3 + &
&16.D0*a2*c*d*e*f*g4*i2*k2*m*n3 + &
&4.D0*a2*c2*f2*g4*i2*k2*m*n3 + &
&32.D0*a*b*c2*e2*g3*h*i2*k2*m*n3 + &
&32.D0*a2*c*d*e2*g3*h*i2*k2*m*n3 + &
&32.D0*a2*c2*e*f*g3*h*i2*k2*m*n3 + &
&24.D0*a2*c2*e2*g2*h2*i2*k2*m*n3 + &
&16.D0*a*b*c2*e2*g4*i*j*k2*m*n3 + &
&16.D0*a2*c*d*e2*g4*i*j*k2*m*n3 + &
&16.D0*a2*c2*e*f*g4*i*j*k2*m*n3 + &
&32.D0*a2*c2*e2*g3*h*i*j*k2*m*n3 + &
&4.D0*a2*c2*e2*g4*j2*k2*m*n3 + &
&16.D0*a*b*c2*e2*g4*i2*k*l*m*n3 + &
&16.D0*a2*c*d*e2*g4*i2*k*l*m*n3 + &
&16.D0*a2*c2*e*f*g4*i2*k*l*m*n3 + &
&32.D0*a2*c2*e2*g3*h*i2*k*l*m*n3 + &
&16.D0*a2*c2*e2*g4*i*j*k*l*m*n3 + &
&4.D0*a2*c2*e2*g4*i2*l2*m*n3 + &
&2.D0*a*b*c2*e2*g4*i2*k2*n4 + &
&2.D0*a2*c*d*e2*g4*i2*k2*n4 + &
&2.D0*a2*c2*e*f*g4*i2*k2*n4 + &
&4.D0*a2*c2*e2*g3*h*i2*k2*n4 + &
&2.D0*a2*c2*e2*g4*i*j*k2*n4 + &
&2.D0*a2*c2*e2*g4*i2*k*l*n4

IONIZ_PROBA(6)=b2*d2*f2*g4*i2*k2*m4 + &
&8.D0*b2*d2*e*f*g3*h*i2*k2*m4 + &
&8.D0*b2*c*d*f2*g3*h*i2*k2*m4 + &
&8.D0*a*b*d2*f2*g3*h*i2*k2*m4 + &
&6.D0*b2*d2*e2*g2*h2*i2*k2*m4 + &
&24.D0*b2*c*d*e*f*g2*h2*i2*k2*m4 + &
&24.D0*a*b*d2*e*f*g2*h2*i2*k2*m4 + &
&6.D0*b2*c2*f2*g2*h2*i2*k2*m4 + &
&24.D0*a*b*c*d*f2*g2*h2*i2*k2*m4 + &
&6.D0*a2*d2*f2*g2*h2*i2*k2*m4 + &
&8.D0*b2*c*d*e2*g*h3*i2*k2*m4 + &
&8.D0*a*b*d2*e2*g*h3*i2*k2*m4 + &
&8.D0*b2*c2*e*f*g*h3*i2*k2*m4 + &
&32.D0*a*b*c*d*e*f*g*h3*i2*k2*m4 + &
&8.D0*a2*d2*e*f*g*h3*i2*k2*m4 + &
&8.D0*a*b*c2*f2*g*h3*i2*k2*m4 + &
&8.D0*a2*c*d*f2*g*h3*i2*k2*m4 + &
&b2*c2*e2*h4*i2*k2*m4 + &
&4.D0*a*b*c*d*e2*h4*i2*k2*m4 + &
&a2*d2*e2*h4*i2*k2*m4 + &
&4.D0*a*b*c2*e*f*h4*i2*k2*m4 + &
&4.D0*a2*c*d*e*f*h4*i2*k2*m4 + &
&a2*c2*f2*h4*i2*k2*m4 + &
&4.D0*b2*d2*e*f*g4*i*j*k2*m4 + &
&4.D0*b2*c*d*f2*g4*i*j*k2*m4 + &
&4.D0*a*b*d2*f2*g4*i*j*k2*m4 + &
&8.D0*b2*d2*e2*g3*h*i*j*k2*m4 + &
&32.D0*b2*c*d*e*f*g3*h*i*j*k2*m4 + &
&32.D0*a*b*d2*e*f*g3*h*i*j*k2*m4 + &
&8.D0*b2*c2*f2*g3*h*i*j*k2*m4 + &
&32.D0*a*b*c*d*f2*g3*h*i*j*k2*m4 + &
&8.D0*a2*d2*f2*g3*h*i*j*k2*m4 + &
&24.D0*b2*c*d*e2*g2*h2*i*j*k2*m4 + &
&24.D0*a*b*d2*e2*g2*h2*i*j*k2*m4 + &
&24.D0*b2*c2*e*f*g2*h2*i*j*k2*m4 + &
&96.D0*a*b*c*d*e*f*g2*h2*i*j*k2*m4 + &
&24.D0*a2*d2*e*f*g2*h2*i*j*k2*m4 + &
&24.D0*a*b*c2*f2*g2*h2*i*j*k2*m4 + &
&24.D0*a2*c*d*f2*g2*h2*i*j*k2*m4 + &
&8.D0*b2*c2*e2*g*h3*i*j*k2*m4 + &
&32.D0*a*b*c*d*e2*g*h3*i*j*k2*m4 + &
&8.D0*a2*d2*e2*g*h3*i*j*k2*m4 + & 
&32.D0*a*b*c2*e*f*g*h3*i*j*k2*m4 + &
&32.D0*a2*c*d*e*f*g*h3*i*j*k2*m4 + &
&8.D0*a2*c2*f2*g*h3*i*j*k2*m4 + &
&4.D0*a*b*c2*e2*h4*i*j*k2*m4 + &
&4.D0*a2*c*d*e2*h4*i*j*k2*m4 + &
&4.D0*a2*c2*e*f*h4*i*j*k2*m4 + &
&b2*d2*e2*g4*j2*k2*m4 + &
&4.D0*b2*c*d*e*f*g4*j2*k2*m4 + &
&4.D0*a*b*d2*e*f*g4*j2*k2*m4 + &
&b2*c2*f2*g4*j2*k2*m4 + &
&4.D0*a*b*c*d*f2*g4*j2*k2*m4 + &
&a2*d2*f2*g4*j2*k2*m4 + &
&8.D0*b2*c*d*e2*g3*h*j2*k2*m4 + &
&8.D0*a*b*d2*e2*g3*h*j2*k2*m4 + &
&8.D0*b2*c2*e*f*g3*h*j2*k2*m4 + &
&32.D0*a*b*c*d*e*f*g3*h*j2*k2*m4 + &
&8.D0*a2*d2*e*f*g3*h*j2*k2*m4 + &
&8.D0*a*b*c2*f2*g3*h*j2*k2*m4 + &
&8.D0*a2*c*d*f2*g3*h*j2*k2*m4 + &
&6.D0*b2*c2*e2*g2*h2*j2*k2*m4 + &
&24.D0*a*b*c*d*e2*g2*h2*j2*k2*m4 + &
&6.D0*a2*d2*e2*g2*h2*j2*k2*m4 + &
&24.D0*a*b*c2*e*f*g2*h2*j2*k2*m4 + &
&24.D0*a2*c*d*e*f*g2*h2*j2*k2*m4 + &
&6.D0*a2*c2*f2*g2*h2*j2*k2*m4 + &
&8.D0*a*b*c2*e2*g*h3*j2*k2*m4 + &
&8.D0*a2*c*d*e2*g*h3*j2*k2*m4 + &
&8.D0*a2*c2*e*f*g*h3*j2*k2*m4 + &
&a2*c2*e2*h4*j2*k2*m4 + &
&4.D0*b2*d2*e*f*g4*i2*k*l*m4 + &
&4.D0*b2*c*d*f2*g4*i2*k*l*m4 + &
&4.D0*a*b*d2*f2*g4*i2*k*l*m4 + &
&8.D0*b2*d2*e2*g3*h*i2*k*l*m4 + &
&32.D0*b2*c*d*e*f*g3*h*i2*k*l*m4 + &
&32.D0*a*b*d2*e*f*g3*h*i2*k*l*m4 + &
&8.D0*b2*c2*f2*g3*h*i2*k*l*m4 + &
&32.D0*a*b*c*d*f2*g3*h*i2*k*l*m4 + &
&8.D0*a2*d2*f2*g3*h*i2*k*l*m4 + &
&24.D0*b2*c*d*e2*g2*h2*i2*k*l*m4 + &
&24.D0*a*b*d2*e2*g2*h2*i2*k*l*m4 + &
&24.D0*b2*c2*e*f*g2*h2*i2*k*l*m4 + &
&96.D0*a*b*c*d*e*f*g2*h2*i2*k*l*m4 + &
&24.D0*a2*d2*e*f*g2*h2*i2*k*l*m4 + &
&24.D0*a*b*c2*f2*g2*h2*i2*k*l*m4 + &
&24.D0*a2*c*d*f2*g2*h2*i2*k*l*m4 + &
&8.D0*b2*c2*e2*g*h3*i2*k*l*m4 + &
&32.D0*a*b*c*d*e2*g*h3*i2*k*l*m4 + &
&8.D0*a2*d2*e2*g*h3*i2*k*l*m4 + &
&32.D0*a*b*c2*e*f*g*h3*i2*k*l*m4 + &
&32.D0*a2*c*d*e*f*g*h3*i2*k*l*m4 + &
&8.D0*a2*c2*f2*g*h3*i2*k*l*m4 + &
&4.D0*a*b*c2*e2*h4*i2*k*l*m4 + &
&4.D0*a2*c*d*e2*h4*i2*k*l*m4 + &
&4.D0*a2*c2*e*f*h4*i2*k*l*m4 + &
&4.D0*b2*d2*e2*g4*i*j*k*l*m4 + &
&16.D0*b2*c*d*e*f*g4*i*j*k*l*m4 + &
&16.D0*a*b*d2*e*f*g4*i*j*k*l*m4 + &
&4.D0*b2*c2*f2*g4*i*j*k*l*m4 + &
&16.D0*a*b*c*d*f2*g4*i*j*k*l*m4 + &
&4.D0*a2*d2*f2*g4*i*j*k*l*m4 + &
&32.D0*b2*c*d*e2*g3*h*i*j*k*l*m4 + &
&32.D0*a*b*d2*e2*g3*h*i*j*k*l*m4 + &
&32.D0*b2*c2*e*f*g3*h*i*j*k*l*m4 + &
&128.D0*a*b*c*d*e*f*g3*h*i*j*k*l*m4 + &
&32.D0*a2*d2*e*f*g3*h*i*j*k*l*m4 + &
&32.D0*a*b*c2*f2*g3*h*i*j*k*l*m4 + &
&32.D0*a2*c*d*f2*g3*h*i*j*k*l*m4 + &
&24.D0*b2*c2*e2*g2*h2*i*j*k*l*m4 + &
&96.D0*a*b*c*d*e2*g2*h2*i*j*k*l*m4 + &
&24.D0*a2*d2*e2*g2*h2*i*j*k*l*m4 + &
&96.D0*a*b*c2*e*f*g2*h2*i*j*k*l*m4 + &
&96.D0*a2*c*d*e*f*g2*h2*i*j*k*l*m4 + &
&24.D0*a2*c2*f2*g2*h2*i*j*k*l*m4 + &
&32.D0*a*b*c2*e2*g*h3*i*j*k*l*m4 + &
&32.D0*a2*c*d*e2*g*h3*i*j*k*l*m4 + &
&32.D0*a2*c2*e*f*g*h3*i*j*k*l*m4 + &
&4.D0*a2*c2*e2*h4*i*j*k*l*m4 + &
&4.D0*b2*c*d*e2*g4*j2*k*l*m4 + &
&4.D0*a*b*d2*e2*g4*j2*k*l*m4 + &
&4.D0*b2*c2*e*f*g4*j2*k*l*m4 + &
&16.D0*a*b*c*d*e*f*g4*j2*k*l*m4 + &
&4.D0*a2*d2*e*f*g4*j2*k*l*m4 + &
&4.D0*a*b*c2*f2*g4*j2*k*l*m4 + &
&4.D0*a2*c*d*f2*g4*j2*k*l*m4 + &
&8.D0*b2*c2*e2*g3*h*j2*k*l*m4 + &
&32.D0*a*b*c*d*e2*g3*h*j2*k*l*m4 + &
&8.D0*a2*d2*e2*g3*h*j2*k*l*m4 + &
&32.D0*a*b*c2*e*f*g3*h*j2*k*l*m4 + &
&32.D0*a2*c*d*e*f*g3*h*j2*k*l*m4 + &
&8.D0*a2*c2*f2*g3*h*j2*k*l*m4 + &
&24.D0*a*b*c2*e2*g2*h2*j2*k*l*m4 + &
&24.D0*a2*c*d*e2*g2*h2*j2*k*l*m4 + &
&24.D0*a2*c2*e*f*g2*h2*j2*k*l*m4 + &
&8.D0*a2*c2*e2*g*h3*j2*k*l*m4 + &
&b2*d2*e2*g4*i2*l2*m4 + &
&4.D0*b2*c*d*e*f*g4*i2*l2*m4 + &
&4.D0*a*b*d2*e*f*g4*i2*l2*m4 + &
&b2*c2*f2*g4*i2*l2*m4 + &
&4.D0*a*b*c*d*f2*g4*i2*l2*m4 + &
&a2*d2*f2*g4*i2*l2*m4 + &
&8.D0*b2*c*d*e2*g3*h*i2*l2*m4 + &
&8.D0*a*b*d2*e2*g3*h*i2*l2*m4 + &
&8.D0*b2*c2*e*f*g3*h*i2*l2*m4 + &
&32.D0*a*b*c*d*e*f*g3*h*i2*l2*m4 + &
&8.D0*a2*d2*e*f*g3*h*i2*l2*m4 + &
&8.D0*a*b*c2*f2*g3*h*i2*l2*m4 + &
&8.D0*a2*c*d*f2*g3*h*i2*l2*m4 + &
&6.D0*b2*c2*e2*g2*h2*i2*l2*m4 + &
&24.D0*a*b*c*d*e2*g2*h2*i2*l2*m4 + &
&6.D0*a2*d2*e2*g2*h2*i2*l2*m4 + &
&24.D0*a*b*c2*e*f*g2*h2*i2*l2*m4 + &
&24.D0*a2*c*d*e*f*g2*h2*i2*l2*m4 + &
&6.D0*a2*c2*f2*g2*h2*i2*l2*m4 + &
&8.D0*a*b*c2*e2*g*h3*i2*l2*m4 + &
&8.D0*a2*c*d*e2*g*h3*i2*l2*m4 + &
&8.D0*a2*c2*e*f*g*h3*i2*l2*m4 + &
&a2*c2*e2*h4*i2*l2*m4 + &
&4.D0*b2*c*d*e2*g4*i*j*l2*m4 + &
&4.D0*a*b*d2*e2*g4*i*j*l2*m4 + &
&4.D0*b2*c2*e*f*g4*i*j*l2*m4 + &
&16.D0*a*b*c*d*e*f*g4*i*j*l2*m4 + &
&4.D0*a2*d2*e*f*g4*i*j*l2*m4 + &
&4.D0*a*b*c2*f2*g4*i*j*l2*m4 + &
&4.D0*a2*c*d*f2*g4*i*j*l2*m4 + &
&8.D0*b2*c2*e2*g3*h*i*j*l2*m4 + &
&32.D0*a*b*c*d*e2*g3*h*i*j*l2*m4 + &
&8.D0*a2*d2*e2*g3*h*i*j*l2*m4 + &
&32.D0*a*b*c2*e*f*g3*h*i*j*l2*m4 + &
&32.D0*a2*c*d*e*f*g3*h*i*j*l2*m4 + &
&8.D0*a2*c2*f2*g3*h*i*j*l2*m4 + &
&24.D0*a*b*c2*e2*g2*h2*i*j*l2*m4 + &
&24.D0*a2*c*d*e2*g2*h2*i*j*l2*m4 + &
&24.D0*a2*c2*e*f*g2*h2*i*j*l2*m4 + &
&8.D0*a2*c2*e2*g*h3*i*j*l2*m4 + &
&b2*c2*e2*g4*j2*l2*m4 + &
&4.D0*a*b*c*d*e2*g4*j2*l2*m4 + &
&a2*d2*e2*g4*j2*l2*m4 + &
&4.D0*a*b*c2*e*f*g4*j2*l2*m4 + &
&4.D0*a2*c*d*e*f*g4*j2*l2*m4 + &
&a2*c2*f2*g4*j2*l2*m4 + &
&8.D0*a*b*c2*e2*g3*h*j2*l2*m4 + &
&8.D0*a2*c*d*e2*g3*h*j2*l2*m4 + &
&8.D0*a2*c2*e*f*g3*h*j2*l2*m4 + &
&6.D0*a2*c2*e2*g2*h2*j2*l2*m4 + &
&8.D0*b2*d2*e*f*g4*i2*k2*m3*n + &
&8.D0*b2*c*d*f2*g4*i2*k2*m3*n + &
&8.D0*a*b*d2*f2*g4*i2*k2*m3*n + &
&16.D0*b2*d2*e2*g3*h*i2*k2*m3*n + &
&64.D0*b2*c*d*e*f*g3*h*i2*k2*m3*n + &
&64.D0*a*b*d2*e*f*g3*h*i2*k2*m3*n + &
&16.D0*b2*c2*f2*g3*h*i2*k2*m3*n + &
&64.D0*a*b*c*d*f2*g3*h*i2*k2*m3*n + &
&16.D0*a2*d2*f2*g3*h*i2*k2*m3*n + &
&48.D0*b2*c*d*e2*g2*h2*i2*k2*m3*n + & 
&48.D0*a*b*d2*e2*g2*h2*i2*k2*m3*n + &
&48.D0*b2*c2*e*f*g2*h2*i2*k2*m3*n + &
&192.D0*a*b*c*d*e*f*g2*h2*i2*k2*m3*n + &
&48.D0*a2*d2*e*f*g2*h2*i2*k2*m3*n + &
&48.D0*a*b*c2*f2*g2*h2*i2*k2*m3*n + &
&48.D0*a2*c*d*f2*g2*h2*i2*k2*m3*n + & 
&16.D0*b2*c2*e2*g*h3*i2*k2*m3*n + &
&64.D0*a*b*c*d*e2*g*h3*i2*k2*m3*n + &
&16.D0*a2*d2*e2*g*h3*i2*k2*m3*n + &
&64.D0*a*b*c2*e*f*g*h3*i2*k2*m3*n + &
&64.D0*a2*c*d*e*f*g*h3*i2*k2*m3*n + &
&16.D0*a2*c2*f2*g*h3*i2*k2*m3*n + &
&8.D0*a*b*c2*e2*h4*i2*k2*m3*n + &
&8.D0*a2*c*d*e2*h4*i2*k2*m3*n + &
&8.D0*a2*c2*e*f*h4*i2*k2*m3*n + &
&8.D0*b2*d2*e2*g4*i*j*k2*m3*n + &
&32.D0*b2*c*d*e*f*g4*i*j*k2*m3*n + &
&32.D0*a*b*d2*e*f*g4*i*j*k2*m3*n + &
&8.D0*b2*c2*f2*g4*i*j*k2*m3*n + &
&32.D0*a*b*c*d*f2*g4*i*j*k2*m3*n + &
&8.D0*a2*d2*f2*g4*i*j*k2*m3*n + &
&64.D0*b2*c*d*e2*g3*h*i*j*k2*m3*n + &
&64.D0*a*b*d2*e2*g3*h*i*j*k2*m3*n + &
&64.D0*b2*c2*e*f*g3*h*i*j*k2*m3*n + &
&256.D0*a*b*c*d*e*f*g3*h*i*j*k2*m3*n + &
&64.D0*a2*d2*e*f*g3*h*i*j*k2*m3*n + &
&64.D0*a*b*c2*f2*g3*h*i*j*k2*m3*n + &
&64.D0*a2*c*d*f2*g3*h*i*j*k2*m3*n + &
&48.D0*b2*c2*e2*g2*h2*i*j*k2*m3*n + &
&192.D0*a*b*c*d*e2*g2*h2*i*j*k2*m3*n + &
&48.D0*a2*d2*e2*g2*h2*i*j*k2*m3*n + &
&192.D0*a*b*c2*e*f*g2*h2*i*j*k2*m3*n + &
&192.D0*a2*c*d*e*f*g2*h2*i*j*k2*m3*n + &
&48.D0*a2*c2*f2*g2*h2*i*j*k2*m3*n + &
&64.D0*a*b*c2*e2*g*h3*i*j*k2*m3*n + &
&64.D0*a2*c*d*e2*g*h3*i*j*k2*m3*n + &
&64.D0*a2*c2*e*f*g*h3*i*j*k2*m3*n + &
&8.D0*a2*c2*e2*h4*i*j*k2*m3*n + &
&8.D0*b2*c*d*e2*g4*j2*k2*m3*n + &
&8.D0*a*b*d2*e2*g4*j2*k2*m3*n + &
&8.D0*b2*c2*e*f*g4*j2*k2*m3*n + &
&32.D0*a*b*c*d*e*f*g4*j2*k2*m3*n + &
&8.D0*a2*d2*e*f*g4*j2*k2*m3*n + &
&8.D0*a*b*c2*f2*g4*j2*k2*m3*n + &
&8.D0*a2*c*d*f2*g4*j2*k2*m3*n + &
&16.D0*b2*c2*e2*g3*h*j2*k2*m3*n + &
&64.D0*a*b*c*d*e2*g3*h*j2*k2*m3*n + &
&16.D0*a2*d2*e2*g3*h*j2*k2*m3*n + &
&64.D0*a*b*c2*e*f*g3*h*j2*k2*m3*n + &
&64.D0*a2*c*d*e*f*g3*h*j2*k2*m3*n + &
&16.D0*a2*c2*f2*g3*h*j2*k2*m3*n + &
&48.D0*a*b*c2*e2*g2*h2*j2*k2*m3*n + &
&48.D0*a2*c*d*e2*g2*h2*j2*k2*m3*n + &
&48.D0*a2*c2*e*f*g2*h2*j2*k2*m3*n + &
&16.D0*a2*c2*e2*g*h3*j2*k2*m3*n + &
&8.D0*b2*d2*e2*g4*i2*k*l*m3*n + &
&32.D0*b2*c*d*e*f*g4*i2*k*l*m3*n + &
&32.D0*a*b*d2*e*f*g4*i2*k*l*m3*n + &
&8.D0*b2*c2*f2*g4*i2*k*l*m3*n + &
&32.D0*a*b*c*d*f2*g4*i2*k*l*m3*n + &
&8.D0*a2*d2*f2*g4*i2*k*l*m3*n + &
&64.D0*b2*c*d*e2*g3*h*i2*k*l*m3*n + &
&64.D0*a*b*d2*e2*g3*h*i2*k*l*m3*n + &
&64.D0*b2*c2*e*f*g3*h*i2*k*l*m3*n + &
&256.D0*a*b*c*d*e*f*g3*h*i2*k*l*m3*n + &
&64.D0*a2*d2*e*f*g3*h*i2*k*l*m3*n + &
&64.D0*a*b*c2*f2*g3*h*i2*k*l*m3*n + &
&64.D0*a2*c*d*f2*g3*h*i2*k*l*m3*n + &
&48.D0*b2*c2*e2*g2*h2*i2*k*l*m3*n + &
&192.D0*a*b*c*d*e2*g2*h2*i2*k*l*m3*n + &
&48.D0*a2*d2*e2*g2*h2*i2*k*l*m3*n + &
&192.D0*a*b*c2*e*f*g2*h2*i2*k*l*m3*n + &
&192.D0*a2*c*d*e*f*g2*h2*i2*k*l*m3*n + &
&48.D0*a2*c2*f2*g2*h2*i2*k*l*m3*n + &
&64.D0*a*b*c2*e2*g*h3*i2*k*l*m3*n + &
&64.D0*a2*c*d*e2*g*h3*i2*k*l*m3*n + &
&64.D0*a2*c2*e*f*g*h3*i2*k*l*m3*n + &
&8.D0*a2*c2*e2*h4*i2*k*l*m3*n + &
&32.D0*b2*c*d*e2*g4*i*j*k*l*m3*n + &
&32.D0*a*b*d2*e2*g4*i*j*k*l*m3*n + &
&32.D0*b2*c2*e*f*g4*i*j*k*l*m3*n + &
&128.D0*a*b*c*d*e*f*g4*i*j*k*l*m3*n + &
&32.D0*a2*d2*e*f*g4*i*j*k*l*m3*n + &
&32.D0*a*b*c2*f2*g4*i*j*k*l*m3*n + &
&32.D0*a2*c*d*f2*g4*i*j*k*l*m3*n + &
&64.D0*b2*c2*e2*g3*h*i*j*k*l*m3*n + &
&256.D0*a*b*c*d*e2*g3*h*i*j*k*l*m3*n + &
&64.D0*a2*d2*e2*g3*h*i*j*k*l*m3*n + &
&256.D0*a*b*c2*e*f*g3*h*i*j*k*l*m3*n + &
&256.D0*a2*c*d*e*f*g3*h*i*j*k*l*m3*n + &
&64.D0*a2*c2*f2*g3*h*i*j*k*l*m3*n + &
&192.D0*a*b*c2*e2*g2*h2*i*j*k*l*m3*n + &
&192.D0*a2*c*d*e2*g2*h2*i*j*k*l*m3*n + &
&192.D0*a2*c2*e*f*g2*h2*i*j*k*l*m3*n + &
&64.D0*a2*c2*e2*g*h3*i*j*k*l*m3*n + &
&8.D0*b2*c2*e2*g4*j2*k*l*m3*n + &
&32.D0*a*b*c*d*e2*g4*j2*k*l*m3*n + &
&8.D0*a2*d2*e2*g4*j2*k*l*m3*n + &
&32.D0*a*b*c2*e*f*g4*j2*k*l*m3*n + &
&32.D0*a2*c*d*e*f*g4*j2*k*l*m3*n + &
&8.D0*a2*c2*f2*g4*j2*k*l*m3*n + &
&64.D0*a*b*c2*e2*g3*h*j2*k*l*m3*n + &
&64.D0*a2*c*d*e2*g3*h*j2*k*l*m3*n + &
&64.D0*a2*c2*e*f*g3*h*j2*k*l*m3*n + &
&48.D0*a2*c2*e2*g2*h2*j2*k*l*m3*n + &
&8.D0*b2*c*d*e2*g4*i2*l2*m3*n + &
&8.D0*a*b*d2*e2*g4*i2*l2*m3*n + &
&8.D0*b2*c2*e*f*g4*i2*l2*m3*n + &
&32.D0*a*b*c*d*e*f*g4*i2*l2*m3*n + &
&8.D0*a2*d2*e*f*g4*i2*l2*m3*n + &
&8.D0*a*b*c2*f2*g4*i2*l2*m3*n + &
&8.D0*a2*c*d*f2*g4*i2*l2*m3*n + &
&16.D0*b2*c2*e2*g3*h*i2*l2*m3*n + &
&64.D0*a*b*c*d*e2*g3*h*i2*l2*m3*n + &
&16.D0*a2*d2*e2*g3*h*i2*l2*m3*n + &
&64.D0*a*b*c2*e*f*g3*h*i2*l2*m3*n + &
&64.D0*a2*c*d*e*f*g3*h*i2*l2*m3*n + &
&16.D0*a2*c2*f2*g3*h*i2*l2*m3*n + &
&48.D0*a*b*c2*e2*g2*h2*i2*l2*m3*n + &
&48.D0*a2*c*d*e2*g2*h2*i2*l2*m3*n + &
&48.D0*a2*c2*e*f*g2*h2*i2*l2*m3*n + &
&16.D0*a2*c2*e2*g*h3*i2*l2*m3*n + &
&8.D0*b2*c2*e2*g4*i*j*l2*m3*n + &
&32.D0*a*b*c*d*e2*g4*i*j*l2*m3*n + &
&8.D0*a2*d2*e2*g4*i*j*l2*m3*n + &
&32.D0*a*b*c2*e*f*g4*i*j*l2*m3*n + &
&32.D0*a2*c*d*e*f*g4*i*j*l2*m3*n + &
&8.D0*a2*c2*f2*g4*i*j*l2*m3*n + &
&64.D0*a*b*c2*e2*g3*h*i*j*l2*m3*n + &
&64.D0*a2*c*d*e2*g3*h*i*j*l2*m3*n + &
&64.D0*a2*c2*e*f*g3*h*i*j*l2*m3*n + &
&48.D0*a2*c2*e2*g2*h2*i*j*l2*m3*n + &
&8.D0*a*b*c2*e2*g4*j2*l2*m3*n + &
&8.D0*a2*c*d*e2*g4*j2*l2*m3*n + &
&8.D0*a2*c2*e*f*g4*j2*l2*m3*n + &
&16.D0*a2*c2*e2*g3*h*j2*l2*m3*n + &
&6.D0*b2*d2*e2*g4*i2*k2*m2*n2 + &
&24.D0*b2*c*d*e*f*g4*i2*k2*m2*n2 + &
&24.D0*a*b*d2*e*f*g4*i2*k2*m2*n2 + &
&6.D0*b2*c2*f2*g4*i2*k2*m2*n2 + &
&24.D0*a*b*c*d*f2*g4*i2*k2*m2*n2 + &
&6.D0*a2*d2*f2*g4*i2*k2*m2*n2 + &
&48.D0*b2*c*d*e2*g3*h*i2*k2*m2*n2 + &
&48.D0*a*b*d2*e2*g3*h*i2*k2*m2*n2 + &
&48.D0*b2*c2*e*f*g3*h*i2*k2*m2*n2 + &
&192.D0*a*b*c*d*e*f*g3*h*i2*k2*m2*n2 + &
&48.D0*a2*d2*e*f*g3*h*i2*k2*m2*n2 + &
&48.D0*a*b*c2*f2*g3*h*i2*k2*m2*n2 + &
&48.D0*a2*c*d*f2*g3*h*i2*k2*m2*n2 + &
&36.D0*b2*c2*e2*g2*h2*i2*k2*m2*n2 + &
&144.D0*a*b*c*d*e2*g2*h2*i2*k2*m2*n2 + &
&36.D0*a2*d2*e2*g2*h2*i2*k2*m2*n2 + &
&144.D0*a*b*c2*e*f*g2*h2*i2*k2*m2*n2 + &
&144.D0*a2*c*d*e*f*g2*h2*i2*k2*m2*n2 + &
&36.D0*a2*c2*f2*g2*h2*i2*k2*m2*n2 + &
&48.D0*a*b*c2*e2*g*h3*i2*k2*m2*n2 + &
&48.D0*a2*c*d*e2*g*h3*i2*k2*m2*n2 + &
&48.D0*a2*c2*e*f*g*h3*i2*k2*m2*n2 + &
&6.D0*a2*c2*e2*h4*i2*k2*m2*n2 + &
&24.D0*b2*c*d*e2*g4*i*j*k2*m2*n2 + &
&24.D0*a*b*d2*e2*g4*i*j*k2*m2*n2 + &
&24.D0*b2*c2*e*f*g4*i*j*k2*m2*n2 + &
&96.D0*a*b*c*d*e*f*g4*i*j*k2*m2*n2 + &
&24.D0*a2*d2*e*f*g4*i*j*k2*m2*n2 + &
&24.D0*a*b*c2*f2*g4*i*j*k2*m2*n2 + &
&24.D0*a2*c*d*f2*g4*i*j*k2*m2*n2 + &
&48.D0*b2*c2*e2*g3*h*i*j*k2*m2*n2 + &
&192.D0*a*b*c*d*e2*g3*h*i*j*k2*m2*n2 + &
&48.D0*a2*d2*e2*g3*h*i*j*k2*m2*n2 + &
&192.D0*a*b*c2*e*f*g3*h*i*j*k2*m2*n2 + &
&192.D0*a2*c*d*e*f*g3*h*i*j*k2*m2*n2 + &
&48.D0*a2*c2*f2*g3*h*i*j*k2*m2*n2 + &
&144.D0*a*b*c2*e2*g2*h2*i*j*k2*m2*n2 + &
&144.D0*a2*c*d*e2*g2*h2*i*j*k2*m2*n2 + &
&144.D0*a2*c2*e*f*g2*h2*i*j*k2*m2*n2 + &
&48.D0*a2*c2*e2*g*h3*i*j*k2*m2*n2 + &
&6.D0*b2*c2*e2*g4*j2*k2*m2*n2 + &
&24.D0*a*b*c*d*e2*g4*j2*k2*m2*n2 + &
&6.D0*a2*d2*e2*g4*j2*k2*m2*n2 + &
&24.D0*a*b*c2*e*f*g4*j2*k2*m2*n2 + &
&24.D0*a2*c*d*e*f*g4*j2*k2*m2*n2 + &
&6.D0*a2*c2*f2*g4*j2*k2*m2*n2 + &
&48.D0*a*b*c2*e2*g3*h*j2*k2*m2*n2 + &
&48.D0*a2*c*d*e2*g3*h*j2*k2*m2*n2 + & 
&48.D0*a2*c2*e*f*g3*h*j2*k2*m2*n2 + &
&36.D0*a2*c2*e2*g2*h2*j2*k2*m2*n2 + &
&24.D0*b2*c*d*e2*g4*i2*k*l*m2*n2 + &
&24.D0*a*b*d2*e2*g4*i2*k*l*m2*n2 + &
&24.D0*b2*c2*e*f*g4*i2*k*l*m2*n2 + &
&96.D0*a*b*c*d*e*f*g4*i2*k*l*m2*n2 + &
&24.D0*a2*d2*e*f*g4*i2*k*l*m2*n2 + &
&24.D0*a*b*c2*f2*g4*i2*k*l*m2*n2 + &
&24.D0*a2*c*d*f2*g4*i2*k*l*m2*n2 + &
&48.D0*b2*c2*e2*g3*h*i2*k*l*m2*n2 + &
&192.D0*a*b*c*d*e2*g3*h*i2*k*l*m2*n2 + &
&48.D0*a2*d2*e2*g3*h*i2*k*l*m2*n2 + &
&192.D0*a*b*c2*e*f*g3*h*i2*k*l*m2*n2 + &
&192.D0*a2*c*d*e*f*g3*h*i2*k*l*m2*n2 + &
&48.D0*a2*c2*f2*g3*h*i2*k*l*m2*n2 + &
&144.D0*a*b*c2*e2*g2*h2*i2*k*l*m2*n2 + &
&144.D0*a2*c*d*e2*g2*h2*i2*k*l*m2*n2 + &
&144.D0*a2*c2*e*f*g2*h2*i2*k*l*m2*n2 + &
&48.D0*a2*c2*e2*g*h3*i2*k*l*m2*n2 + &
&24.D0*b2*c2*e2*g4*i*j*k*l*m2*n2 + &
&96.D0*a*b*c*d*e2*g4*i*j*k*l*m2*n2 + &
&24.D0*a2*d2*e2*g4*i*j*k*l*m2*n2 + &
&96.D0*a*b*c2*e*f*g4*i*j*k*l*m2*n2 + &
&96.D0*a2*c*d*e*f*g4*i*j*k*l*m2*n2 + &
&24.D0*a2*c2*f2*g4*i*j*k*l*m2*n2 + &
&192.D0*a*b*c2*e2*g3*h*i*j*k*l*m2*n2 + &
&192.D0*a2*c*d*e2*g3*h*i*j*k*l*m2*n2 + &
&192.D0*a2*c2*e*f*g3*h*i*j*k*l*m2*n2 + &
&144.D0*a2*c2*e2*g2*h2*i*j*k*l*m2*n2 + &
&24.D0*a*b*c2*e2*g4*j2*k*l*m2*n2 + &
&24.D0*a2*c*d*e2*g4*j2*k*l*m2*n2 + &
&24.D0*a2*c2*e*f*g4*j2*k*l*m2*n2 + &
&48.D0*a2*c2*e2*g3*h*j2*k*l*m2*n2 + &
&6.D0*b2*c2*e2*g4*i2*l2*m2*n2 + &
&24.D0*a*b*c*d*e2*g4*i2*l2*m2*n2 + &
&6.D0*a2*d2*e2*g4*i2*l2*m2*n2 + &
&24.D0*a*b*c2*e*f*g4*i2*l2*m2*n2 + &
&24.D0*a2*c*d*e*f*g4*i2*l2*m2*n2 + &
&6.D0*a2*c2*f2*g4*i2*l2*m2*n2 + &
&48.D0*a*b*c2*e2*g3*h*i2*l2*m2*n2 + &
&48.D0*a2*c*d*e2*g3*h*i2*l2*m2*n2 + &
&48.D0*a2*c2*e*f*g3*h*i2*l2*m2*n2 + &
&36.D0*a2*c2*e2*g2*h2*i2*l2*m2*n2 + &
&24.D0*a*b*c2*e2*g4*i*j*l2*m2*n2 + &
&24.D0*a2*c*d*e2*g4*i*j*l2*m2*n2 + &
&24.D0*a2*c2*e*f*g4*i*j*l2*m2*n2 + &
&48.D0*a2*c2*e2*g3*h*i*j*l2*m2*n2 + &
&6.D0*a2*c2*e2*g4*j2*l2*m2*n2 + &
&8.D0*b2*c*d*e2*g4*i2*k2*m*n3 + &
&8.D0*a*b*d2*e2*g4*i2*k2*m*n3 + &
&8.D0*b2*c2*e*f*g4*i2*k2*m*n3 + &
&32.D0*a*b*c*d*e*f*g4*i2*k2*m*n3 + &
&8.D0*a2*d2*e*f*g4*i2*k2*m*n3 + &
&8.D0*a*b*c2*f2*g4*i2*k2*m*n3 + &
&8.D0*a2*c*d*f2*g4*i2*k2*m*n3 + &
&16.D0*b2*c2*e2*g3*h*i2*k2*m*n3 + &
&64.D0*a*b*c*d*e2*g3*h*i2*k2*m*n3 + &
&16.D0*a2*d2*e2*g3*h*i2*k2*m*n3 + &
&64.D0*a*b*c2*e*f*g3*h*i2*k2*m*n3 + &
&64.D0*a2*c*d*e*f*g3*h*i2*k2*m*n3 + & 
&16.D0*a2*c2*f2*g3*h*i2*k2*m*n3 + &
&48.D0*a*b*c2*e2*g2*h2*i2*k2*m*n3 + &
&48.D0*a2*c*d*e2*g2*h2*i2*k2*m*n3 + &
&48.D0*a2*c2*e*f*g2*h2*i2*k2*m*n3 + &
&16.D0*a2*c2*e2*g*h3*i2*k2*m*n3 + &
&8.D0*b2*c2*e2*g4*i*j*k2*m*n3 + &
&32.D0*a*b*c*d*e2*g4*i*j*k2*m*n3 + &
&8.D0*a2*d2*e2*g4*i*j*k2*m*n3 + &
&32.D0*a*b*c2*e*f*g4*i*j*k2*m*n3 + &
&32.D0*a2*c*d*e*f*g4*i*j*k2*m*n3 + &
&8.D0*a2*c2*f2*g4*i*j*k2*m*n3 + &
&64.D0*a*b*c2*e2*g3*h*i*j*k2*m*n3 + &
&64.D0*a2*c*d*e2*g3*h*i*j*k2*m*n3 + &
&64.D0*a2*c2*e*f*g3*h*i*j*k2*m*n3 + &
&48.D0*a2*c2*e2*g2*h2*i*j*k2*m*n3 + &
&8.D0*a*b*c2*e2*g4*j2*k2*m*n3 + &
&8.D0*a2*c*d*e2*g4*j2*k2*m*n3 + &
&8.D0*a2*c2*e*f*g4*j2*k2*m*n3 + &
&16.D0*a2*c2*e2*g3*h*j2*k2*m*n3 + &
&8.D0*b2*c2*e2*g4*i2*k*l*m*n3 + &
&32.D0*a*b*c*d*e2*g4*i2*k*l*m*n3 + &
&8.D0*a2*d2*e2*g4*i2*k*l*m*n3 + &
&32.D0*a*b*c2*e*f*g4*i2*k*l*m*n3 + &
&32.D0*a2*c*d*e*f*g4*i2*k*l*m*n3 + &
&8.D0*a2*c2*f2*g4*i2*k*l*m*n3 + &
&64.D0*a*b*c2*e2*g3*h*i2*k*l*m*n3 + &
&64.D0*a2*c*d*e2*g3*h*i2*k*l*m*n3 + &
&64.D0*a2*c2*e*f*g3*h*i2*k*l*m*n3 + & 
&48.D0*a2*c2*e2*g2*h2*i2*k*l*m*n3 + &
&32.D0*a*b*c2*e2*g4*i*j*k*l*m*n3 + &
&32.D0*a2*c*d*e2*g4*i*j*k*l*m*n3 + &
&32.D0*a2*c2*e*f*g4*i*j*k*l*m*n3 + &
&64.D0*a2*c2*e2*g3*h*i*j*k*l*m*n3 + &
&8.D0*a2*c2*e2*g4*j2*k*l*m*n3 + &
&8.D0*a*b*c2*e2*g4*i2*l2*m*n3 + &
&8.D0*a2*c*d*e2*g4*i2*l2*m*n3 + &
&8.D0*a2*c2*e*f*g4*i2*l2*m*n3 + &
&16.D0*a2*c2*e2*g3*h*i2*l2*m*n3 + &
&8.D0*a2*c2*e2*g4*i*j*l2*m*n3 + &
&b2*c2*e2*g4*i2*k2*n4 + &
&4.D0*a*b*c*d*e2*g4*i2*k2*n4 + &
&a2*d2*e2*g4*i2*k2*n4 + &
&4.D0*a*b*c2*e*f*g4*i2*k2*n4 + &
&4.D0*a2*c*d*e*f*g4*i2*k2*n4 + &
&a2*c2*f2*g4*i2*k2*n4 + &
&8.D0*a*b*c2*e2*g3*h*i2*k2*n4 + &
&8.D0*a2*c*d*e2*g3*h*i2*k2*n4 + &
&8.D0*a2*c2*e*f*g3*h*i2*k2*n4 + &
&6.D0*a2*c2*e2*g2*h2*i2*k2*n4 + &
&4.D0*a*b*c2*e2*g4*i*j*k2*n4 + &
&4.D0*a2*c*d*e2*g4*i*j*k2*n4 + &
&4.D0*a2*c2*e*f*g4*i*j*k2*n4 + &
&8.D0*a2*c2*e2*g3*h*i*j*k2*n4 + &
&a2*c2*e2*g4*j2*k2*n4 + &
&4.D0*a*b*c2*e2*g4*i2*k*l*n4 + &
&4.D0*a2*c*d*e2*g4*i2*k*l*n4 + &
&4.D0*a2*c2*e*f*g4*i2*k*l*n4 + &
&8.D0*a2*c2*e2*g3*h*i2*k*l*n4 + &
&4.D0*a2*c2*e2*g4*i*j*k*l*n4 + &
&a2*c2*e2*g4*i2*l2*n4

IONIZ_PROBA(7)=4.D0*b2*d2*f2*g3*h*i2*k2*m4 + &
&12.D0*b2*d2*e*f*g2*h2*i2*k2*m4 + &
&12.D0*b2*c*d*f2*g2*h2*i2*k2*m4 + &
&12.D0*a*b*d2*f2*g2*h2*i2*k2*m4 + &
&4.D0*b2*d2*e2*g*h3*i2*k2*m4 + &
&16.D0*b2*c*d*e*f*g*h3*i2*k2*m4 + &
&16.D0*a*b*d2*e*f*g*h3*i2*k2*m4 + &
&4.D0*b2*c2*f2*g*h3*i2*k2*m4 + &
&16.D0*a*b*c*d*f2*g*h3*i2*k2*m4 + &
&4.D0*a2*d2*f2*g*h3*i2*k2*m4 + &
&2.D0*b2*c*d*e2*h4*i2*k2*m4 + &
&2.D0*a*b*d2*e2*h4*i2*k2*m4 + &
&2.D0*b2*c2*e*f*h4*i2*k2*m4 + &
&8.D0*a*b*c*d*e*f*h4*i2*k2*m4 + &
&2.D0*a2*d2*e*f*h4*i2*k2*m4 + &
&2.D0*a*b*c2*f2*h4*i2*k2*m4 + &
&2.D0*a2*c*d*f2*h4*i2*k2*m4 + &
&2.D0*b2*d2*f2*g4*i*j*k2*m4 + &
&16.D0*b2*d2*e*f*g3*h*i*j*k2*m4 + &
&16.D0*b2*c*d*f2*g3*h*i*j*k2*m4 + &
&16.D0*a*b*d2*f2*g3*h*i*j*k2*m4 + &
&12.D0*b2*d2*e2*g2*h2*i*j*k2*m4 + &
&48.D0*b2*c*d*e*f*g2*h2*i*j*k2*m4 + &
&48.D0*a*b*d2*e*f*g2*h2*i*j*k2*m4 + &
&12.D0*b2*c2*f2*g2*h2*i*j*k2*m4 + &
&48.D0*a*b*c*d*f2*g2*h2*i*j*k2*m4 + &
&12.D0*a2*d2*f2*g2*h2*i*j*k2*m4 + &
&16.D0*b2*c*d*e2*g*h3*i*j*k2*m4 + &
&16.D0*a*b*d2*e2*g*h3*i*j*k2*m4 + &
&16.D0*b2*c2*e*f*g*h3*i*j*k2*m4 + &
&64.D0*a*b*c*d*e*f*g*h3*i*j*k2*m4 + &
&16.D0*a2*d2*e*f*g*h3*i*j*k2*m4 + &
&16.D0*a*b*c2*f2*g*h3*i*j*k2*m4 + &
&16.D0*a2*c*d*f2*g*h3*i*j*k2*m4 + &
&2.D0*b2*c2*e2*h4*i*j*k2*m4 + &
&8.D0*a*b*c*d*e2*h4*i*j*k2*m4 + &
&2.D0*a2*d2*e2*h4*i*j*k2*m4 + &
&8.D0*a*b*c2*e*f*h4*i*j*k2*m4 + &
&8.D0*a2*c*d*e*f*h4*i*j*k2*m4 + &
&2.D0*a2*c2*f2*h4*i*j*k2*m4 + &
&2.D0*b2*d2*e*f*g4*j2*k2*m4 + &
&2.D0*b2*c*d*f2*g4*j2*k2*m4 + &
&2.D0*a*b*d2*f2*g4*j2*k2*m4 + &
&4.D0*b2*d2*e2*g3*h*j2*k2*m4 + &
&16.D0*b2*c*d*e*f*g3*h*j2*k2*m4 + &
&16.D0*a*b*d2*e*f*g3*h*j2*k2*m4 + &
&4.D0*b2*c2*f2*g3*h*j2*k2*m4 + &
&16.D0*a*b*c*d*f2*g3*h*j2*k2*m4 + &
&4.D0*a2*d2*f2*g3*h*j2*k2*m4 + &
&12.D0*b2*c*d*e2*g2*h2*j2*k2*m4 + &
&12.D0*a*b*d2*e2*g2*h2*j2*k2*m4 + &
&12.D0*b2*c2*e*f*g2*h2*j2*k2*m4 + &
&48.D0*a*b*c*d*e*f*g2*h2*j2*k2*m4 + &
&12.D0*a2*d2*e*f*g2*h2*j2*k2*m4 + &
&12.D0*a*b*c2*f2*g2*h2*j2*k2*m4 + &
&12.D0*a2*c*d*f2*g2*h2*j2*k2*m4 + &
&4.D0*b2*c2*e2*g*h3*j2*k2*m4 + &
&16.D0*a*b*c*d*e2*g*h3*j2*k2*m4 + &
&4.D0*a2*d2*e2*g*h3*j2*k2*m4 + &
&16.D0*a*b*c2*e*f*g*h3*j2*k2*m4 + &
&16.D0*a2*c*d*e*f*g*h3*j2*k2*m4 + &
&4.D0*a2*c2*f2*g*h3*j2*k2*m4 + &
&2.D0*a*b*c2*e2*h4*j2*k2*m4 + &
&2.D0*a2*c*d*e2*h4*j2*k2*m4 + &
&2.D0*a2*c2*e*f*h4*j2*k2*m4 + &
&2.D0*b2*d2*f2*g4*i2*k*l*m4 + &
&16.D0*b2*d2*e*f*g3*h*i2*k*l*m4 + &
&16.D0*b2*c*d*f2*g3*h*i2*k*l*m4 + &
&16.D0*a*b*d2*f2*g3*h*i2*k*l*m4 + &
&12.D0*b2*d2*e2*g2*h2*i2*k*l*m4 + &
&48.D0*b2*c*d*e*f*g2*h2*i2*k*l*m4 + &
&48.D0*a*b*d2*e*f*g2*h2*i2*k*l*m4 + &
&12.D0*b2*c2*f2*g2*h2*i2*k*l*m4 + &
&48.D0*a*b*c*d*f2*g2*h2*i2*k*l*m4 + &
&12.D0*a2*d2*f2*g2*h2*i2*k*l*m4 + &
&16.D0*b2*c*d*e2*g*h3*i2*k*l*m4 + &
&16.D0*a*b*d2*e2*g*h3*i2*k*l*m4 + &
&16.D0*b2*c2*e*f*g*h3*i2*k*l*m4 + &
&64.D0*a*b*c*d*e*f*g*h3*i2*k*l*m4 + &
&16.D0*a2*d2*e*f*g*h3*i2*k*l*m4 + &
&16.D0*a*b*c2*f2*g*h3*i2*k*l*m4 + &
&16.D0*a2*c*d*f2*g*h3*i2*k*l*m4 + &
&2.D0*b2*c2*e2*h4*i2*k*l*m4 + &
&8.D0*a*b*c*d*e2*h4*i2*k*l*m4 + &
&2.D0*a2*d2*e2*h4*i2*k*l*m4 + &
&8.D0*a*b*c2*e*f*h4*i2*k*l*m4 + &
&8.D0*a2*c*d*e*f*h4*i2*k*l*m4 + &
&2.D0*a2*c2*f2*h4*i2*k*l*m4 + &
&8.D0*b2*d2*e*f*g4*i*j*k*l*m4 + &
&8.D0*b2*c*d*f2*g4*i*j*k*l*m4 + &
&8.D0*a*b*d2*f2*g4*i*j*k*l*m4 + &
&16.D0*b2*d2*e2*g3*h*i*j*k*l*m4 + &
&64.D0*b2*c*d*e*f*g3*h*i*j*k*l*m4 + &
&64.D0*a*b*d2*e*f*g3*h*i*j*k*l*m4 + &
&16.D0*b2*c2*f2*g3*h*i*j*k*l*m4 + &
&64.D0*a*b*c*d*f2*g3*h*i*j*k*l*m4 + &
&16.D0*a2*d2*f2*g3*h*i*j*k*l*m4 + &
&48.D0*b2*c*d*e2*g2*h2*i*j*k*l*m4 + &
&48.D0*a*b*d2*e2*g2*h2*i*j*k*l*m4 + &
&48.D0*b2*c2*e*f*g2*h2*i*j*k*l*m4 + &
&192.D0*a*b*c*d*e*f*g2*h2*i*j*k*l*m4 + &
&48.D0*a2*d2*e*f*g2*h2*i*j*k*l*m4 + &
&48.D0*a*b*c2*f2*g2*h2*i*j*k*l*m4 + &
&48.D0*a2*c*d*f2*g2*h2*i*j*k*l*m4 + &
&16.D0*b2*c2*e2*g*h3*i*j*k*l*m4 + &
&64.D0*a*b*c*d*e2*g*h3*i*j*k*l*m4 + &
&16.D0*a2*d2*e2*g*h3*i*j*k*l*m4 + &
&64.D0*a*b*c2*e*f*g*h3*i*j*k*l*m4 + &
&64.D0*a2*c*d*e*f*g*h3*i*j*k*l*m4 + &
&16.D0*a2*c2*f2*g*h3*i*j*k*l*m4 + &
&8.D0*a*b*c2*e2*h4*i*j*k*l*m4 + &
&8.D0*a2*c*d*e2*h4*i*j*k*l*m4 + &
&8.D0*a2*c2*e*f*h4*i*j*k*l*m4 + &
&2.D0*b2*d2*e2*g4*j2*k*l*m4 + &
&8.D0*b2*c*d*e*f*g4*j2*k*l*m4 + &
&8.D0*a*b*d2*e*f*g4*j2*k*l*m4 + &
&2.D0*b2*c2*f2*g4*j2*k*l*m4 + &
&8.D0*a*b*c*d*f2*g4*j2*k*l*m4 + &
&2.D0*a2*d2*f2*g4*j2*k*l*m4 + &
&16.D0*b2*c*d*e2*g3*h*j2*k*l*m4 + &
&16.D0*a*b*d2*e2*g3*h*j2*k*l*m4 + &
&16.D0*b2*c2*e*f*g3*h*j2*k*l*m4 + &
&64.D0*a*b*c*d*e*f*g3*h*j2*k*l*m4 + &
&16.D0*a2*d2*e*f*g3*h*j2*k*l*m4 + &
&16.D0*a*b*c2*f2*g3*h*j2*k*l*m4 + &
&16.D0*a2*c*d*f2*g3*h*j2*k*l*m4 + &
&12.D0*b2*c2*e2*g2*h2*j2*k*l*m4 + &
&48.D0*a*b*c*d*e2*g2*h2*j2*k*l*m4 + &
&12.D0*a2*d2*e2*g2*h2*j2*k*l*m4 + &
&48.D0*a*b*c2*e*f*g2*h2*j2*k*l*m4 + &
&48.D0*a2*c*d*e*f*g2*h2*j2*k*l*m4 + &
&12.D0*a2*c2*f2*g2*h2*j2*k*l*m4 + &
&16.D0*a*b*c2*e2*g*h3*j2*k*l*m4 + &
&16.D0*a2*c*d*e2*g*h3*j2*k*l*m4 + &
&16.D0*a2*c2*e*f*g*h3*j2*k*l*m4 + &
&2.D0*a2*c2*e2*h4*j2*k*l*m4 + &
&2.D0*b2*d2*e*f*g4*i2*l2*m4 + &
&2.D0*b2*c*d*f2*g4*i2*l2*m4 + &
&2.D0*a*b*d2*f2*g4*i2*l2*m4 + &
&4.D0*b2*d2*e2*g3*h*i2*l2*m4 + &
&16.D0*b2*c*d*e*f*g3*h*i2*l2*m4 + &
&16.D0*a*b*d2*e*f*g3*h*i2*l2*m4 + &
&4.D0*b2*c2*f2*g3*h*i2*l2*m4 + &
&16.D0*a*b*c*d*f2*g3*h*i2*l2*m4 + &
&4.D0*a2*d2*f2*g3*h*i2*l2*m4 + &
&12.D0*b2*c*d*e2*g2*h2*i2*l2*m4 + &
&12.D0*a*b*d2*e2*g2*h2*i2*l2*m4 + &
&12.D0*b2*c2*e*f*g2*h2*i2*l2*m4 + &
&48.D0*a*b*c*d*e*f*g2*h2*i2*l2*m4 + &
&12.D0*a2*d2*e*f*g2*h2*i2*l2*m4 + &
&12.D0*a*b*c2*f2*g2*h2*i2*l2*m4 + &
&12.D0*a2*c*d*f2*g2*h2*i2*l2*m4 + &
&4.D0*b2*c2*e2*g*h3*i2*l2*m4 + &
&16.D0*a*b*c*d*e2*g*h3*i2*l2*m4 + &
&4.D0*a2*d2*e2*g*h3*i2*l2*m4 + &
&16.D0*a*b*c2*e*f*g*h3*i2*l2*m4 + &
&16.D0*a2*c*d*e*f*g*h3*i2*l2*m4 + &
&4.D0*a2*c2*f2*g*h3*i2*l2*m4 + &
&2.D0*a*b*c2*e2*h4*i2*l2*m4 + &
&2.D0*a2*c*d*e2*h4*i2*l2*m4 + &
&2.D0*a2*c2*e*f*h4*i2*l2*m4 + &
&2.D0*b2*d2*e2*g4*i*j*l2*m4 + & 
&8.D0*b2*c*d*e*f*g4*i*j*l2*m4 + &
&8.D0*a*b*d2*e*f*g4*i*j*l2*m4 + &
&2.D0*b2*c2*f2*g4*i*j*l2*m4 + &
&8.D0*a*b*c*d*f2*g4*i*j*l2*m4 + &
&2.D0*a2*d2*f2*g4*i*j*l2*m4 + &
&16.D0*b2*c*d*e2*g3*h*i*j*l2*m4 + &
&16.D0*a*b*d2*e2*g3*h*i*j*l2*m4 + &
&16.D0*b2*c2*e*f*g3*h*i*j*l2*m4 + &
&64.D0*a*b*c*d*e*f*g3*h*i*j*l2*m4 + &
&16.D0*a2*d2*e*f*g3*h*i*j*l2*m4 + &
&16.D0*a*b*c2*f2*g3*h*i*j*l2*m4 + &
&16.D0*a2*c*d*f2*g3*h*i*j*l2*m4 + &
&12.D0*b2*c2*e2*g2*h2*i*j*l2*m4 + &
&48.D0*a*b*c*d*e2*g2*h2*i*j*l2*m4 + &
&12.D0*a2*d2*e2*g2*h2*i*j*l2*m4 + &
&48.D0*a*b*c2*e*f*g2*h2*i*j*l2*m4 + &
&48.D0*a2*c*d*e*f*g2*h2*i*j*l2*m4 + &
&12.D0*a2*c2*f2*g2*h2*i*j*l2*m4 + &
&16.D0*a*b*c2*e2*g*h3*i*j*l2*m4 + &
&16.D0*a2*c*d*e2*g*h3*i*j*l2*m4 + &
&16.D0*a2*c2*e*f*g*h3*i*j*l2*m4 + &
&2.D0*a2*c2*e2*h4*i*j*l2*m4 + &
&2.D0*b2*c*d*e2*g4*j2*l2*m4 + &
&2.D0*a*b*d2*e2*g4*j2*l2*m4 + &
&2.D0*b2*c2*e*f*g4*j2*l2*m4 + &
&8.D0*a*b*c*d*e*f*g4*j2*l2*m4 + &
&2.D0*a2*d2*e*f*g4*j2*l2*m4 + &
&2.D0*a*b*c2*f2*g4*j2*l2*m4 + &
&2.D0*a2*c*d*f2*g4*j2*l2*m4 + &
&4.D0*b2*c2*e2*g3*h*j2*l2*m4 + &
&16.D0*a*b*c*d*e2*g3*h*j2*l2*m4 + &
&4.D0*a2*d2*e2*g3*h*j2*l2*m4 + &
&16.D0*a*b*c2*e*f*g3*h*j2*l2*m4 + &
&16.D0*a2*c*d*e*f*g3*h*j2*l2*m4 + &
&4.D0*a2*c2*f2*g3*h*j2*l2*m4 + &
&12.D0*a*b*c2*e2*g2*h2*j2*l2*m4 + &
&12.D0*a2*c*d*e2*g2*h2*j2*l2*m4 + &
&12.D0*a2*c2*e*f*g2*h2*j2*l2*m4 + &
&4.D0*a2*c2*e2*g*h3*j2*l2*m4 + &
&4.D0*b2*d2*f2*g4*i2*k2*m3*n + &
&32.D0*b2*d2*e*f*g3*h*i2*k2*m3*n + &
&32.D0*b2*c*d*f2*g3*h*i2*k2*m3*n + &
&32.D0*a*b*d2*f2*g3*h*i2*k2*m3*n + &
&24.D0*b2*d2*e2*g2*h2*i2*k2*m3*n + &
&96.D0*b2*c*d*e*f*g2*h2*i2*k2*m3*n + &
&96.D0*a*b*d2*e*f*g2*h2*i2*k2*m3*n + &
&24.D0*b2*c2*f2*g2*h2*i2*k2*m3*n + &
&96.D0*a*b*c*d*f2*g2*h2*i2*k2*m3*n + &
&24.D0*a2*d2*f2*g2*h2*i2*k2*m3*n + &
&32.D0*b2*c*d*e2*g*h3*i2*k2*m3*n + &
&32.D0*a*b*d2*e2*g*h3*i2*k2*m3*n + &
&32.D0*b2*c2*e*f*g*h3*i2*k2*m3*n + &
&128.D0*a*b*c*d*e*f*g*h3*i2*k2*m3*n + &
&32.D0*a2*d2*e*f*g*h3*i2*k2*m3*n + &
&32.D0*a*b*c2*f2*g*h3*i2*k2*m3*n + &
&32.D0*a2*c*d*f2*g*h3*i2*k2*m3*n + &
&4.D0*b2*c2*e2*h4*i2*k2*m3*n + &
&16.D0*a*b*c*d*e2*h4*i2*k2*m3*n + &
&4.D0*a2*d2*e2*h4*i2*k2*m3*n + &
&16.D0*a*b*c2*e*f*h4*i2*k2*m3*n + &
&16.D0*a2*c*d*e*f*h4*i2*k2*m3*n + &
&4.D0*a2*c2*f2*h4*i2*k2*m3*n + &
&16.D0*b2*d2*e*f*g4*i*j*k2*m3*n + &
&16.D0*b2*c*d*f2*g4*i*j*k2*m3*n + &
&16.D0*a*b*d2*f2*g4*i*j*k2*m3*n + &
&32.D0*b2*d2*e2*g3*h*i*j*k2*m3*n + &
&128.D0*b2*c*d*e*f*g3*h*i*j*k2*m3*n + &
&128.D0*a*b*d2*e*f*g3*h*i*j*k2*m3*n + &
&32.D0*b2*c2*f2*g3*h*i*j*k2*m3*n + &
&128.D0*a*b*c*d*f2*g3*h*i*j*k2*m3*n + &
&32.D0*a2*d2*f2*g3*h*i*j*k2*m3*n + &
&96.D0*b2*c*d*e2*g2*h2*i*j*k2*m3*n + &
&96.D0*a*b*d2*e2*g2*h2*i*j*k2*m3*n + &
&96.D0*b2*c2*e*f*g2*h2*i*j*k2*m3*n + &
&384.D0*a*b*c*d*e*f*g2*h2*i*j*k2*m3*n + &
&96.D0*a2*d2*e*f*g2*h2*i*j*k2*m3*n + &
&96.D0*a*b*c2*f2*g2*h2*i*j*k2*m3*n + &
&96.D0*a2*c*d*f2*g2*h2*i*j*k2*m3*n + &
&32.D0*b2*c2*e2*g*h3*i*j*k2*m3*n + &
&128.D0*a*b*c*d*e2*g*h3*i*j*k2*m3*n + &
&32.D0*a2*d2*e2*g*h3*i*j*k2*m3*n + &
&128.D0*a*b*c2*e*f*g*h3*i*j*k2*m3*n + &
&128.D0*a2*c*d*e*f*g*h3*i*j*k2*m3*n + &
&32.D0*a2*c2*f2*g*h3*i*j*k2*m3*n + &
&16.D0*a*b*c2*e2*h4*i*j*k2*m3*n + &
&16.D0*a2*c*d*e2*h4*i*j*k2*m3*n + &
&16.D0*a2*c2*e*f*h4*i*j*k2*m3*n + &
&4.D0*b2*d2*e2*g4*j2*k2*m3*n + &
&16.D0*b2*c*d*e*f*g4*j2*k2*m3*n + &
&16.D0*a*b*d2*e*f*g4*j2*k2*m3*n + &
&4.D0*b2*c2*f2*g4*j2*k2*m3*n + &
&16.D0*a*b*c*d*f2*g4*j2*k2*m3*n + &
&4.D0*a2*d2*f2*g4*j2*k2*m3*n + &
&32.D0*b2*c*d*e2*g3*h*j2*k2*m3*n + &
&32.D0*a*b*d2*e2*g3*h*j2*k2*m3*n + &
&32.D0*b2*c2*e*f*g3*h*j2*k2*m3*n + &
&128.D0*a*b*c*d*e*f*g3*h*j2*k2*m3*n + &
&32.D0*a2*d2*e*f*g3*h*j2*k2*m3*n + &
&32.D0*a*b*c2*f2*g3*h*j2*k2*m3*n + &
&32.D0*a2*c*d*f2*g3*h*j2*k2*m3*n + &
&24.D0*b2*c2*e2*g2*h2*j2*k2*m3*n + &
&96.D0*a*b*c*d*e2*g2*h2*j2*k2*m3*n + &
&24.D0*a2*d2*e2*g2*h2*j2*k2*m3*n + &
&96.D0*a*b*c2*e*f*g2*h2*j2*k2*m3*n + &
&96.D0*a2*c*d*e*f*g2*h2*j2*k2*m3*n + &
&24.D0*a2*c2*f2*g2*h2*j2*k2*m3*n + &
&32.D0*a*b*c2*e2*g*h3*j2*k2*m3*n + &
&32.D0*a2*c*d*e2*g*h3*j2*k2*m3*n + &
&32.D0*a2*c2*e*f*g*h3*j2*k2*m3*n + &
&4.D0*a2*c2*e2*h4*j2*k2*m3*n + &
&16.D0*b2*d2*e*f*g4*i2*k*l*m3*n + &
&16.D0*b2*c*d*f2*g4*i2*k*l*m3*n + &
&16.D0*a*b*d2*f2*g4*i2*k*l*m3*n + &
&32.D0*b2*d2*e2*g3*h*i2*k*l*m3*n + &
&128.D0*b2*c*d*e*f*g3*h*i2*k*l*m3*n + &
&128.D0*a*b*d2*e*f*g3*h*i2*k*l*m3*n + &
&32.D0*b2*c2*f2*g3*h*i2*k*l*m3*n + &
&128.D0*a*b*c*d*f2*g3*h*i2*k*l*m3*n + &
&32.D0*a2*d2*f2*g3*h*i2*k*l*m3*n + &
&96.D0*b2*c*d*e2*g2*h2*i2*k*l*m3*n + &
&96.D0*a*b*d2*e2*g2*h2*i2*k*l*m3*n + &
&96.D0*b2*c2*e*f*g2*h2*i2*k*l*m3*n + &
&384.D0*a*b*c*d*e*f*g2*h2*i2*k*l*m3*n + &
&96.D0*a2*d2*e*f*g2*h2*i2*k*l*m3*n + &
&96.D0*a*b*c2*f2*g2*h2*i2*k*l*m3*n + &
&96.D0*a2*c*d*f2*g2*h2*i2*k*l*m3*n + &
&32.D0*b2*c2*e2*g*h3*i2*k*l*m3*n + &
&128.D0*a*b*c*d*e2*g*h3*i2*k*l*m3*n + &
&32.D0*a2*d2*e2*g*h3*i2*k*l*m3*n + &
&128.D0*a*b*c2*e*f*g*h3*i2*k*l*m3*n + &
&128.D0*a2*c*d*e*f*g*h3*i2*k*l*m3*n + &
&32.D0*a2*c2*f2*g*h3*i2*k*l*m3*n + &
&16.D0*a*b*c2*e2*h4*i2*k*l*m3*n + &
&16.D0*a2*c*d*e2*h4*i2*k*l*m3*n + &
&16.D0*a2*c2*e*f*h4*i2*k*l*m3*n + &
&16.D0*b2*d2*e2*g4*i*j*k*l*m3*n + &
&64.D0*b2*c*d*e*f*g4*i*j*k*l*m3*n + &
&64.D0*a*b*d2*e*f*g4*i*j*k*l*m3*n + &
&16.D0*b2*c2*f2*g4*i*j*k*l*m3*n + &
&64.D0*a*b*c*d*f2*g4*i*j*k*l*m3*n + &
&16.D0*a2*d2*f2*g4*i*j*k*l*m3*n + &
&128.D0*b2*c*d*e2*g3*h*i*j*k*l*m3*n + &
&128.D0*a*b*d2*e2*g3*h*i*j*k*l*m3*n + &
&128.D0*b2*c2*e*f*g3*h*i*j*k*l*m3*n + &
&512.D0*a*b*c*d*e*f*g3*h*i*j*k*l*m3*n + &
&128.D0*a2*d2*e*f*g3*h*i*j*k*l*m3*n + &
&128.D0*a*b*c2*f2*g3*h*i*j*k*l*m3*n + &
&128.D0*a2*c*d*f2*g3*h*i*j*k*l*m3*n + &
&96.D0*b2*c2*e2*g2*h2*i*j*k*l*m3*n + &
&384.D0*a*b*c*d*e2*g2*h2*i*j*k*l*m3*n + &
&96.D0*a2*d2*e2*g2*h2*i*j*k*l*m3*n + &
&384.D0*a*b*c2*e*f*g2*h2*i*j*k*l*m3*n + &
&384.D0*a2*c*d*e*f*g2*h2*i*j*k*l*m3*n + &
&96.D0*a2*c2*f2*g2*h2*i*j*k*l*m3*n + &
&128.D0*a*b*c2*e2*g*h3*i*j*k*l*m3*n + &
&128.D0*a2*c*d*e2*g*h3*i*j*k*l*m3*n + &
&128.D0*a2*c2*e*f*g*h3*i*j*k*l*m3*n + &
&16.D0*a2*c2*e2*h4*i*j*k*l*m3*n + &
&16.D0*b2*c*d*e2*g4*j2*k*l*m3*n + &
&16.D0*a*b*d2*e2*g4*j2*k*l*m3*n + &
&16.D0*b2*c2*e*f*g4*j2*k*l*m3*n + &
&64.D0*a*b*c*d*e*f*g4*j2*k*l*m3*n + &
&16.D0*a2*d2*e*f*g4*j2*k*l*m3*n + &
&16.D0*a*b*c2*f2*g4*j2*k*l*m3*n + &
&16.D0*a2*c*d*f2*g4*j2*k*l*m3*n + &
&32.D0*b2*c2*e2*g3*h*j2*k*l*m3*n + &
&128.D0*a*b*c*d*e2*g3*h*j2*k*l*m3*n + &
&32.D0*a2*d2*e2*g3*h*j2*k*l*m3*n + &
&128.D0*a*b*c2*e*f*g3*h*j2*k*l*m3*n + &
&128.D0*a2*c*d*e*f*g3*h*j2*k*l*m3*n + &
&32.D0*a2*c2*f2*g3*h*j2*k*l*m3*n + &
&96.D0*a*b*c2*e2*g2*h2*j2*k*l*m3*n + &
&96.D0*a2*c*d*e2*g2*h2*j2*k*l*m3*n + &
&96.D0*a2*c2*e*f*g2*h2*j2*k*l*m3*n + &
&32.D0*a2*c2*e2*g*h3*j2*k*l*m3*n + &
&4.D0*b2*d2*e2*g4*i2*l2*m3*n + &
&16.D0*b2*c*d*e*f*g4*i2*l2*m3*n + &
&16.D0*a*b*d2*e*f*g4*i2*l2*m3*n + &
&4.D0*b2*c2*f2*g4*i2*l2*m3*n + &
&16.D0*a*b*c*d*f2*g4*i2*l2*m3*n + &
&4.D0*a2*d2*f2*g4*i2*l2*m3*n + &
&32.D0*b2*c*d*e2*g3*h*i2*l2*m3*n + &
&32.D0*a*b*d2*e2*g3*h*i2*l2*m3*n + &
&32.D0*b2*c2*e*f*g3*h*i2*l2*m3*n + &
&128.D0*a*b*c*d*e*f*g3*h*i2*l2*m3*n + &
&32.D0*a2*d2*e*f*g3*h*i2*l2*m3*n + &
&32.D0*a*b*c2*f2*g3*h*i2*l2*m3*n + &
&32.D0*a2*c*d*f2*g3*h*i2*l2*m3*n + &
&24.D0*b2*c2*e2*g2*h2*i2*l2*m3*n + &
&96.D0*a*b*c*d*e2*g2*h2*i2*l2*m3*n + &
&24.D0*a2*d2*e2*g2*h2*i2*l2*m3*n + &
&96.D0*a*b*c2*e*f*g2*h2*i2*l2*m3*n + &
&96.D0*a2*c*d*e*f*g2*h2*i2*l2*m3*n + &
&24.D0*a2*c2*f2*g2*h2*i2*l2*m3*n + &
&32.D0*a*b*c2*e2*g*h3*i2*l2*m3*n + &
&32.D0*a2*c*d*e2*g*h3*i2*l2*m3*n + &
&32.D0*a2*c2*e*f*g*h3*i2*l2*m3*n + &
&4.D0*a2*c2*e2*h4*i2*l2*m3*n + &
&16.D0*b2*c*d*e2*g4*i*j*l2*m3*n + &
&16.D0*a*b*d2*e2*g4*i*j*l2*m3*n + &
&16.D0*b2*c2*e*f*g4*i*j*l2*m3*n + &
&64.D0*a*b*c*d*e*f*g4*i*j*l2*m3*n + &
&16.D0*a2*d2*e*f*g4*i*j*l2*m3*n + &
&16.D0*a*b*c2*f2*g4*i*j*l2*m3*n + &
&16.D0*a2*c*d*f2*g4*i*j*l2*m3*n + &
&32.D0*b2*c2*e2*g3*h*i*j*l2*m3*n + &
&128.D0*a*b*c*d*e2*g3*h*i*j*l2*m3*n + &
&32.D0*a2*d2*e2*g3*h*i*j*l2*m3*n + &
&128.D0*a*b*c2*e*f*g3*h*i*j*l2*m3*n + &
&128.D0*a2*c*d*e*f*g3*h*i*j*l2*m3*n + &
&32.D0*a2*c2*f2*g3*h*i*j*l2*m3*n + &
&96.D0*a*b*c2*e2*g2*h2*i*j*l2*m3*n + &
&96.D0*a2*c*d*e2*g2*h2*i*j*l2*m3*n + &
&96.D0*a2*c2*e*f*g2*h2*i*j*l2*m3*n + &
&32.D0*a2*c2*e2*g*h3*i*j*l2*m3*n + &
&4.D0*b2*c2*e2*g4*j2*l2*m3*n + &
&16.D0*a*b*c*d*e2*g4*j2*l2*m3*n + &
&4.D0*a2*d2*e2*g4*j2*l2*m3*n + &
&16.D0*a*b*c2*e*f*g4*j2*l2*m3*n + &
&16.D0*a2*c*d*e*f*g4*j2*l2*m3*n + &
&4.D0*a2*c2*f2*g4*j2*l2*m3*n + &
&32.D0*a*b*c2*e2*g3*h*j2*l2*m3*n + &
&32.D0*a2*c*d*e2*g3*h*j2*l2*m3*n + &
&32.D0*a2*c2*e*f*g3*h*j2*l2*m3*n + &
&24.D0*a2*c2*e2*g2*h2*j2*l2*m3*n + &
&12.D0*b2*d2*e*f*g4*i2*k2*m2*n2 + &
&12.D0*b2*c*d*f2*g4*i2*k2*m2*n2 + &
&12.D0*a*b*d2*f2*g4*i2*k2*m2*n2 + &
&24.D0*b2*d2*e2*g3*h*i2*k2*m2*n2 + &
&96.D0*b2*c*d*e*f*g3*h*i2*k2*m2*n2 + &
&96.D0*a*b*d2*e*f*g3*h*i2*k2*m2*n2 + &
&24.D0*b2*c2*f2*g3*h*i2*k2*m2*n2 + &
&96.D0*a*b*c*d*f2*g3*h*i2*k2*m2*n2 + &
&24.D0*a2*d2*f2*g3*h*i2*k2*m2*n2 + &
&72.D0*b2*c*d*e2*g2*h2*i2*k2*m2*n2 + &
&72.D0*a*b*d2*e2*g2*h2*i2*k2*m2*n2 + &
&72.D0*b2*c2*e*f*g2*h2*i2*k2*m2*n2 + &
&288.D0*a*b*c*d*e*f*g2*h2*i2*k2*m2*n2 + &
&72.D0*a2*d2*e*f*g2*h2*i2*k2*m2*n2 + &
&72.D0*a*b*c2*f2*g2*h2*i2*k2*m2*n2 + &
&72.D0*a2*c*d*f2*g2*h2*i2*k2*m2*n2 + &
&24.D0*b2*c2*e2*g*h3*i2*k2*m2*n2 + &
&96.D0*a*b*c*d*e2*g*h3*i2*k2*m2*n2 + &
&24.D0*a2*d2*e2*g*h3*i2*k2*m2*n2 + &
&96.D0*a*b*c2*e*f*g*h3*i2*k2*m2*n2 + &
&96.D0*a2*c*d*e*f*g*h3*i2*k2*m2*n2 + &
&24.D0*a2*c2*f2*g*h3*i2*k2*m2*n2 + &
&12.D0*a*b*c2*e2*h4*i2*k2*m2*n2 + &
&12.D0*a2*c*d*e2*h4*i2*k2*m2*n2 + &
&12.D0*a2*c2*e*f*h4*i2*k2*m2*n2 + &
&12.D0*b2*d2*e2*g4*i*j*k2*m2*n2 + &
&48.D0*b2*c*d*e*f*g4*i*j*k2*m2*n2 + &
&48.D0*a*b*d2*e*f*g4*i*j*k2*m2*n2 + &
&12.D0*b2*c2*f2*g4*i*j*k2*m2*n2 + &
&48.D0*a*b*c*d*f2*g4*i*j*k2*m2*n2 + &
&12.D0*a2*d2*f2*g4*i*j*k2*m2*n2 + &
&96.D0*b2*c*d*e2*g3*h*i*j*k2*m2*n2 + &
&96.D0*a*b*d2*e2*g3*h*i*j*k2*m2*n2 + &
&96.D0*b2*c2*e*f*g3*h*i*j*k2*m2*n2 + &
&384.D0*a*b*c*d*e*f*g3*h*i*j*k2*m2*n2 + &
&96.D0*a2*d2*e*f*g3*h*i*j*k2*m2*n2 + &
&96.D0*a*b*c2*f2*g3*h*i*j*k2*m2*n2 + &
&96.D0*a2*c*d*f2*g3*h*i*j*k2*m2*n2 + &
&72.D0*b2*c2*e2*g2*h2*i*j*k2*m2*n2 + &
&288.D0*a*b*c*d*e2*g2*h2*i*j*k2*m2*n2 + &
&72.D0*a2*d2*e2*g2*h2*i*j*k2*m2*n2 + &
&288.D0*a*b*c2*e*f*g2*h2*i*j*k2*m2*n2 + &
&288.D0*a2*c*d*e*f*g2*h2*i*j*k2*m2*n2 + &
&72.D0*a2*c2*f2*g2*h2*i*j*k2*m2*n2 + &
&96.D0*a*b*c2*e2*g*h3*i*j*k2*m2*n2 + &
&96.D0*a2*c*d*e2*g*h3*i*j*k2*m2*n2 + &
&96.D0*a2*c2*e*f*g*h3*i*j*k2*m2*n2 + &
&12.D0*a2*c2*e2*h4*i*j*k2*m2*n2 + &
&12.D0*b2*c*d*e2*g4*j2*k2*m2*n2 + &
&12.D0*a*b*d2*e2*g4*j2*k2*m2*n2 + &
&12.D0*b2*c2*e*f*g4*j2*k2*m2*n2 + &
&48.D0*a*b*c*d*e*f*g4*j2*k2*m2*n2 + &
&12.D0*a2*d2*e*f*g4*j2*k2*m2*n2 + &
&12.D0*a*b*c2*f2*g4*j2*k2*m2*n2 + &
&12.D0*a2*c*d*f2*g4*j2*k2*m2*n2 + &
&24.D0*b2*c2*e2*g3*h*j2*k2*m2*n2 + &
&96.D0*a*b*c*d*e2*g3*h*j2*k2*m2*n2 + &
&24.D0*a2*d2*e2*g3*h*j2*k2*m2*n2 + &
&96.D0*a*b*c2*e*f*g3*h*j2*k2*m2*n2 + &
&96.D0*a2*c*d*e*f*g3*h*j2*k2*m2*n2 + &
&24.D0*a2*c2*f2*g3*h*j2*k2*m2*n2 + &
&72.D0*a*b*c2*e2*g2*h2*j2*k2*m2*n2 + &
&72.D0*a2*c*d*e2*g2*h2*j2*k2*m2*n2 + &
&72.D0*a2*c2*e*f*g2*h2*j2*k2*m2*n2 + &
&24.D0*a2*c2*e2*g*h3*j2*k2*m2*n2 + &
&12.D0*b2*d2*e2*g4*i2*k*l*m2*n2 + &
&48.D0*b2*c*d*e*f*g4*i2*k*l*m2*n2 + &
&48.D0*a*b*d2*e*f*g4*i2*k*l*m2*n2 + &
&12.D0*b2*c2*f2*g4*i2*k*l*m2*n2 + &
&48.D0*a*b*c*d*f2*g4*i2*k*l*m2*n2 + &
&12.D0*a2*d2*f2*g4*i2*k*l*m2*n2 + &
&96.D0*b2*c*d*e2*g3*h*i2*k*l*m2*n2 + &
&96.D0*a*b*d2*e2*g3*h*i2*k*l*m2*n2 + &
&96.D0*b2*c2*e*f*g3*h*i2*k*l*m2*n2 + &
&384.D0*a*b*c*d*e*f*g3*h*i2*k*l*m2*n2 + &
&96.D0*a2*d2*e*f*g3*h*i2*k*l*m2*n2 + &
&96.D0*a*b*c2*f2*g3*h*i2*k*l*m2*n2 + &
&96.D0*a2*c*d*f2*g3*h*i2*k*l*m2*n2 + &
&72.D0*b2*c2*e2*g2*h2*i2*k*l*m2*n2 + &
&288.D0*a*b*c*d*e2*g2*h2*i2*k*l*m2*n2 + &
&72.D0*a2*d2*e2*g2*h2*i2*k*l*m2*n2 + &
&288.D0*a*b*c2*e*f*g2*h2*i2*k*l*m2*n2 + &
&288.D0*a2*c*d*e*f*g2*h2*i2*k*l*m2*n2 + &
&72.D0*a2*c2*f2*g2*h2*i2*k*l*m2*n2 + &
&96.D0*a*b*c2*e2*g*h3*i2*k*l*m2*n2 + &
&96.D0*a2*c*d*e2*g*h3*i2*k*l*m2*n2 + &
&96.D0*a2*c2*e*f*g*h3*i2*k*l*m2*n2 + &
&12.D0*a2*c2*e2*h4*i2*k*l*m2*n2 + &
&48.D0*b2*c*d*e2*g4*i*j*k*l*m2*n2 + &
&48.D0*a*b*d2*e2*g4*i*j*k*l*m2*n2 + &
&48.D0*b2*c2*e*f*g4*i*j*k*l*m2*n2 + &
&192.D0*a*b*c*d*e*f*g4*i*j*k*l*m2*n2 + &
&48.D0*a2*d2*e*f*g4*i*j*k*l*m2*n2 + &
&48.D0*a*b*c2*f2*g4*i*j*k*l*m2*n2 + &
&48.D0*a2*c*d*f2*g4*i*j*k*l*m2*n2 + &
&96.D0*b2*c2*e2*g3*h*i*j*k*l*m2*n2 + &
&384.D0*a*b*c*d*e2*g3*h*i*j*k*l*m2*n2 + &
&96.D0*a2*d2*e2*g3*h*i*j*k*l*m2*n2 + &
&384.D0*a*b*c2*e*f*g3*h*i*j*k*l*m2*n2 + &
&384.D0*a2*c*d*e*f*g3*h*i*j*k*l*m2*n2 + &
&96.D0*a2*c2*f2*g3*h*i*j*k*l*m2*n2 + &
&288.D0*a*b*c2*e2*g2*h2*i*j*k*l*m2*n2 + &
&288.D0*a2*c*d*e2*g2*h2*i*j*k*l*m2*n2 + &
&288.D0*a2*c2*e*f*g2*h2*i*j*k*l*m2*n2 + &
&96.D0*a2*c2*e2*g*h3*i*j*k*l*m2*n2 + &
&12.D0*b2*c2*e2*g4*j2*k*l*m2*n2 + &
&48.D0*a*b*c*d*e2*g4*j2*k*l*m2*n2 + &
&12.D0*a2*d2*e2*g4*j2*k*l*m2*n2 + &
&48.D0*a*b*c2*e*f*g4*j2*k*l*m2*n2 + &
&48.D0*a2*c*d*e*f*g4*j2*k*l*m2*n2 + &
&12.D0*a2*c2*f2*g4*j2*k*l*m2*n2 + &
&96.D0*a*b*c2*e2*g3*h*j2*k*l*m2*n2 + &
&96.D0*a2*c*d*e2*g3*h*j2*k*l*m2*n2 + &
&96.D0*a2*c2*e*f*g3*h*j2*k*l*m2*n2 + &
&72.D0*a2*c2*e2*g2*h2*j2*k*l*m2*n2 + &
&12.D0*b2*c*d*e2*g4*i2*l2*m2*n2 + &
&12.D0*a*b*d2*e2*g4*i2*l2*m2*n2 + &
&12.D0*b2*c2*e*f*g4*i2*l2*m2*n2 + &
&48.D0*a*b*c*d*e*f*g4*i2*l2*m2*n2 + &
&12.D0*a2*d2*e*f*g4*i2*l2*m2*n2 + &
&12.D0*a*b*c2*f2*g4*i2*l2*m2*n2 + &
&12.D0*a2*c*d*f2*g4*i2*l2*m2*n2 + &
&24.D0*b2*c2*e2*g3*h*i2*l2*m2*n2 + &
&96.D0*a*b*c*d*e2*g3*h*i2*l2*m2*n2 + &
&24.D0*a2*d2*e2*g3*h*i2*l2*m2*n2 + &
&96.D0*a*b*c2*e*f*g3*h*i2*l2*m2*n2 + &
&96.D0*a2*c*d*e*f*g3*h*i2*l2*m2*n2 + &
&24.D0*a2*c2*f2*g3*h*i2*l2*m2*n2 + &
&72.D0*a*b*c2*e2*g2*h2*i2*l2*m2*n2 + &
&72.D0*a2*c*d*e2*g2*h2*i2*l2*m2*n2 + &
&72.D0*a2*c2*e*f*g2*h2*i2*l2*m2*n2 + &
&24.D0*a2*c2*e2*g*h3*i2*l2*m2*n2 + &
&12.D0*b2*c2*e2*g4*i*j*l2*m2*n2 + &
&48.D0*a*b*c*d*e2*g4*i*j*l2*m2*n2 + &
&12.D0*a2*d2*e2*g4*i*j*l2*m2*n2 + &
&48.D0*a*b*c2*e*f*g4*i*j*l2*m2*n2 + &
&48.D0*a2*c*d*e*f*g4*i*j*l2*m2*n2 + &
&12.D0*a2*c2*f2*g4*i*j*l2*m2*n2 + &
&96.D0*a*b*c2*e2*g3*h*i*j*l2*m2*n2 + &
&96.D0*a2*c*d*e2*g3*h*i*j*l2*m2*n2 + &
&96.D0*a2*c2*e*f*g3*h*i*j*l2*m2*n2 + &
&72.D0*a2*c2*e2*g2*h2*i*j*l2*m2*n2 + &
&12.D0*a*b*c2*e2*g4*j2*l2*m2*n2 + &
&12.D0*a2*c*d*e2*g4*j2*l2*m2*n2 + &
&12.D0*a2*c2*e*f*g4*j2*l2*m2*n2 + &
&24.D0*a2*c2*e2*g3*h*j2*l2*m2*n2 + &
&4.D0*b2*d2*e2*g4*i2*k2*m*n3 + &
&16.D0*b2*c*d*e*f*g4*i2*k2*m*n3 + &
&16.D0*a*b*d2*e*f*g4*i2*k2*m*n3 + &
&4.D0*b2*c2*f2*g4*i2*k2*m*n3 + &
&16.D0*a*b*c*d*f2*g4*i2*k2*m*n3 + &
&4.D0*a2*d2*f2*g4*i2*k2*m*n3 + &
&32.D0*b2*c*d*e2*g3*h*i2*k2*m*n3 + &
&32.D0*a*b*d2*e2*g3*h*i2*k2*m*n3 + &
&32.D0*b2*c2*e*f*g3*h*i2*k2*m*n3 + &
&128.D0*a*b*c*d*e*f*g3*h*i2*k2*m*n3 + &
&32.D0*a2*d2*e*f*g3*h*i2*k2*m*n3 + &
&32.D0*a*b*c2*f2*g3*h*i2*k2*m*n3 + &
&32.D0*a2*c*d*f2*g3*h*i2*k2*m*n3 + &
&24.D0*b2*c2*e2*g2*h2*i2*k2*m*n3 + &
&96.D0*a*b*c*d*e2*g2*h2*i2*k2*m*n3 + &
&24.D0*a2*d2*e2*g2*h2*i2*k2*m*n3 + &
&96.D0*a*b*c2*e*f*g2*h2*i2*k2*m*n3 + &
&96.D0*a2*c*d*e*f*g2*h2*i2*k2*m*n3 + &
&24.D0*a2*c2*f2*g2*h2*i2*k2*m*n3 + &
&32.D0*a*b*c2*e2*g*h3*i2*k2*m*n3 + &
&32.D0*a2*c*d*e2*g*h3*i2*k2*m*n3 + &
&32.D0*a2*c2*e*f*g*h3*i2*k2*m*n3 + &
&4.D0*a2*c2*e2*h4*i2*k2*m*n3 + &
&16.D0*b2*c*d*e2*g4*i*j*k2*m*n3 + &
&16.D0*a*b*d2*e2*g4*i*j*k2*m*n3 + &
&16.D0*b2*c2*e*f*g4*i*j*k2*m*n3 + &
&64.D0*a*b*c*d*e*f*g4*i*j*k2*m*n3 + &
&16.D0*a2*d2*e*f*g4*i*j*k2*m*n3 + &
&16.D0*a*b*c2*f2*g4*i*j*k2*m*n3 + &
&16.D0*a2*c*d*f2*g4*i*j*k2*m*n3 + &
&32.D0*b2*c2*e2*g3*h*i*j*k2*m*n3 + &
&128.D0*a*b*c*d*e2*g3*h*i*j*k2*m*n3 + &
&32.D0*a2*d2*e2*g3*h*i*j*k2*m*n3 + &
&128.D0*a*b*c2*e*f*g3*h*i*j*k2*m*n3 + &
&128.D0*a2*c*d*e*f*g3*h*i*j*k2*m*n3 + &
&32.D0*a2*c2*f2*g3*h*i*j*k2*m*n3 + &
&96.D0*a*b*c2*e2*g2*h2*i*j*k2*m*n3 + &
&96.D0*a2*c*d*e2*g2*h2*i*j*k2*m*n3 + &
&96.D0*a2*c2*e*f*g2*h2*i*j*k2*m*n3 + &
&32.D0*a2*c2*e2*g*h3*i*j*k2*m*n3 + &
&4.D0*b2*c2*e2*g4*j2*k2*m*n3 + &
&16.D0*a*b*c*d*e2*g4*j2*k2*m*n3 + &
&4.D0*a2*d2*e2*g4*j2*k2*m*n3 + &
&16.D0*a*b*c2*e*f*g4*j2*k2*m*n3 + &
&16.D0*a2*c*d*e*f*g4*j2*k2*m*n3 + &
&4.D0*a2*c2*f2*g4*j2*k2*m*n3 + &
&32.D0*a*b*c2*e2*g3*h*j2*k2*m*n3 + &
&32.D0*a2*c*d*e2*g3*h*j2*k2*m*n3 + &
&32.D0*a2*c2*e*f*g3*h*j2*k2*m*n3 + &
&24.D0*a2*c2*e2*g2*h2*j2*k2*m*n3 + &
&16.D0*b2*c*d*e2*g4*i2*k*l*m*n3 + &
&16.D0*a*b*d2*e2*g4*i2*k*l*m*n3 + &
&16.D0*b2*c2*e*f*g4*i2*k*l*m*n3 + &
&64.D0*a*b*c*d*e*f*g4*i2*k*l*m*n3 + &
&16.D0*a2*d2*e*f*g4*i2*k*l*m*n3 + &
&16.D0*a*b*c2*f2*g4*i2*k*l*m*n3 + &
&16.D0*a2*c*d*f2*g4*i2*k*l*m*n3 + &
&32.D0*b2*c2*e2*g3*h*i2*k*l*m*n3 + &
&128.D0*a*b*c*d*e2*g3*h*i2*k*l*m*n3 + &
&32.D0*a2*d2*e2*g3*h*i2*k*l*m*n3 + &
&128.D0*a*b*c2*e*f*g3*h*i2*k*l*m*n3 + &
&128.D0*a2*c*d*e*f*g3*h*i2*k*l*m*n3 + &
&32.D0*a2*c2*f2*g3*h*i2*k*l*m*n3 + &
&96.D0*a*b*c2*e2*g2*h2*i2*k*l*m*n3 + &
&96.D0*a2*c*d*e2*g2*h2*i2*k*l*m*n3 + &
&96.D0*a2*c2*e*f*g2*h2*i2*k*l*m*n3 + &
&32.D0*a2*c2*e2*g*h3*i2*k*l*m*n3 + &
&16.D0*b2*c2*e2*g4*i*j*k*l*m*n3 + &
&64.D0*a*b*c*d*e2*g4*i*j*k*l*m*n3 + &
&16.D0*a2*d2*e2*g4*i*j*k*l*m*n3 + &
&64.D0*a*b*c2*e*f*g4*i*j*k*l*m*n3 + &
&64.D0*a2*c*d*e*f*g4*i*j*k*l*m*n3 + &
&16.D0*a2*c2*f2*g4*i*j*k*l*m*n3 + &
&128.D0*a*b*c2*e2*g3*h*i*j*k*l*m*n3 + &
&128.D0*a2*c*d*e2*g3*h*i*j*k*l*m*n3 + &
&128.D0*a2*c2*e*f*g3*h*i*j*k*l*m*n3 + &
&96.D0*a2*c2*e2*g2*h2*i*j*k*l*m*n3 + &
&16.D0*a*b*c2*e2*g4*j2*k*l*m*n3 + &
&16.D0*a2*c*d*e2*g4*j2*k*l*m*n3 + &
&16.D0*a2*c2*e*f*g4*j2*k*l*m*n3 + &
&32.D0*a2*c2*e2*g3*h*j2*k*l*m*n3 + &
&4.D0*b2*c2*e2*g4*i2*l2*m*n3 + &
&16.D0*a*b*c*d*e2*g4*i2*l2*m*n3 + &
&4.D0*a2*d2*e2*g4*i2*l2*m*n3 + &
&16.D0*a*b*c2*e*f*g4*i2*l2*m*n3 + &
&16.D0*a2*c*d*e*f*g4*i2*l2*m*n3 + &
&4.D0*a2*c2*f2*g4*i2*l2*m*n3 + &
&32.D0*a*b*c2*e2*g3*h*i2*l2*m*n3 + &
&32.D0*a2*c*d*e2*g3*h*i2*l2*m*n3 + &
&32.D0*a2*c2*e*f*g3*h*i2*l2*m*n3 + &
&24.D0*a2*c2*e2*g2*h2*i2*l2*m*n3 + &
&16.D0*a*b*c2*e2*g4*i*j*l2*m*n3 + &
&16.D0*a2*c*d*e2*g4*i*j*l2*m*n3 + &
&16.D0*a2*c2*e*f*g4*i*j*l2*m*n3 + &
&32.D0*a2*c2*e2*g3*h*i*j*l2*m*n3 + &
&4.D0*a2*c2*e2*g4*j2*l2*m*n3 + &
&2.D0*b2*c*d*e2*g4*i2*k2*n4 + &
&2.D0*a*b*d2*e2*g4*i2*k2*n4 + &
&2.D0*b2*c2*e*f*g4*i2*k2*n4 + &
&8.D0*a*b*c*d*e*f*g4*i2*k2*n4 + &
&2.D0*a2*d2*e*f*g4*i2*k2*n4 + &
&2.D0*a*b*c2*f2*g4*i2*k2*n4 + &
&2.D0*a2*c*d*f2*g4*i2*k2*n4 + &
&4.D0*b2*c2*e2*g3*h*i2*k2*n4 + &
&16.D0*a*b*c*d*e2*g3*h*i2*k2*n4 + &
&4.D0*a2*d2*e2*g3*h*i2*k2*n4 + &
&16.D0*a*b*c2*e*f*g3*h*i2*k2*n4 + &
&16.D0*a2*c*d*e*f*g3*h*i2*k2*n4 + &
&4.D0*a2*c2*f2*g3*h*i2*k2*n4 + &
&12.D0*a*b*c2*e2*g2*h2*i2*k2*n4 + &
&12.D0*a2*c*d*e2*g2*h2*i2*k2*n4 + &
&12.D0*a2*c2*e*f*g2*h2*i2*k2*n4 + &
&4.D0*a2*c2*e2*g*h3*i2*k2*n4 + &
&2.D0*b2*c2*e2*g4*i*j*k2*n4 + &
&8.D0*a*b*c*d*e2*g4*i*j*k2*n4 + &
&2.D0*a2*d2*e2*g4*i*j*k2*n4 + &
&8.D0*a*b*c2*e*f*g4*i*j*k2*n4 + &
&8.D0*a2*c*d*e*f*g4*i*j*k2*n4 + &
&2.D0*a2*c2*f2*g4*i*j*k2*n4 + &
&16.D0*a*b*c2*e2*g3*h*i*j*k2*n4 + &
&16.D0*a2*c*d*e2*g3*h*i*j*k2*n4 + &
&16.D0*a2*c2*e*f*g3*h*i*j*k2*n4 + &
&12.D0*a2*c2*e2*g2*h2*i*j*k2*n4 + &
&2.D0*a*b*c2*e2*g4*j2*k2*n4 + &
&2.D0*a2*c*d*e2*g4*j2*k2*n4 + &
&2.D0*a2*c2*e*f*g4*j2*k2*n4 + &
&4.D0*a2*c2*e2*g3*h*j2*k2*n4 + &
&2.D0*b2*c2*e2*g4*i2*k*l*n4 + &
&8.D0*a*b*c*d*e2*g4*i2*k*l*n4 + &
&2.D0*a2*d2*e2*g4*i2*k*l*n4 + &
&8.D0*a*b*c2*e*f*g4*i2*k*l*n4 + &
&8.D0*a2*c*d*e*f*g4*i2*k*l*n4 + &
&2.D0*a2*c2*f2*g4*i2*k*l*n4 + &
&16.D0*a*b*c2*e2*g3*h*i2*k*l*n4 + &
&16.D0*a2*c*d*e2*g3*h*i2*k*l*n4 + &
&16.D0*a2*c2*e*f*g3*h*i2*k*l*n4 + &
&12.D0*a2*c2*e2*g2*h2*i2*k*l*n4 + &
&8.D0*a*b*c2*e2*g4*i*j*k*l*n4 + &
&8.D0*a2*c*d*e2*g4*i*j*k*l*n4 + &
&8.D0*a2*c2*e*f*g4*i*j*k*l*n4 + &
&16.D0*a2*c2*e2*g3*h*i*j*k*l*n4 + &
&2.D0*a2*c2*e2*g4*j2*k*l*n4 + &
&2.D0*a*b*c2*e2*g4*i2*l2*n4 + &
&2.D0*a2*c*d*e2*g4*i2*l2*n4 + &
&2.D0*a2*c2*e*f*g4*i2*l2*n4 + &
&4.D0*a2*c2*e2*g3*h*i2*l2*n4 + &
&2.D0*a2*c2*e2*g4*i*j*l2*n4

IONIZ_PROBA(8)=6.D0*b2*d2*f2*g2*h2*i2*k2*m4 + &
&8.D0*b2*d2*e*f*g*h3*i2*k2*m4 + &
&8.D0*b2*c*d*f2*g*h3*i2*k2*m4 + &
&8.D0*a*b*d2*f2*g*h3*i2*k2*m4 + &
&b2*d2*e2*h4*i2*k2*m4 + &
&4.D0*b2*c*d*e*f*h4*i2*k2*m4 + &
&4.D0*a*b*d2*e*f*h4*i2*k2*m4 + &
&b2*c2*f2*h4*i2*k2*m4 + &
&4.D0*a*b*c*d*f2*h4*i2*k2*m4 + &
&a2*d2*f2*h4*i2*k2*m4 + &
&8.D0*b2*d2*f2*g3*h*i*j*k2*m4 + &
&24.D0*b2*d2*e*f*g2*h2*i*j*k2*m4 + &
&24.D0*b2*c*d*f2*g2*h2*i*j*k2*m4 + &
&24.D0*a*b*d2*f2*g2*h2*i*j*k2*m4 + &
&8.D0*b2*d2*e2*g*h3*i*j*k2*m4 + &
&32.D0*b2*c*d*e*f*g*h3*i*j*k2*m4 + &
&32.D0*a*b*d2*e*f*g*h3*i*j*k2*m4 + &
&8.D0*b2*c2*f2*g*h3*i*j*k2*m4 + &
&32.D0*a*b*c*d*f2*g*h3*i*j*k2*m4 + &
&8.D0*a2*d2*f2*g*h3*i*j*k2*m4 + &
&4.D0*b2*c*d*e2*h4*i*j*k2*m4 + &
&4.D0*a*b*d2*e2*h4*i*j*k2*m4 + &
&4.D0*b2*c2*e*f*h4*i*j*k2*m4 + &
&16.D0*a*b*c*d*e*f*h4*i*j*k2*m4 + &
&4.D0*a2*d2*e*f*h4*i*j*k2*m4 + &
&4.D0*a*b*c2*f2*h4*i*j*k2*m4 + &
&4.D0*a2*c*d*f2*h4*i*j*k2*m4 + &
&b2*d2*f2*g4*j2*k2*m4 + &
&8.D0*b2*d2*e*f*g3*h*j2*k2*m4 + &
&8.D0*b2*c*d*f2*g3*h*j2*k2*m4 + &
&8.D0*a*b*d2*f2*g3*h*j2*k2*m4 + &
&6.D0*b2*d2*e2*g2*h2*j2*k2*m4 + &
&24.D0*b2*c*d*e*f*g2*h2*j2*k2*m4 + &
&24.D0*a*b*d2*e*f*g2*h2*j2*k2*m4 + &
&6.D0*b2*c2*f2*g2*h2*j2*k2*m4 + &
&24.D0*a*b*c*d*f2*g2*h2*j2*k2*m4 + &
&6.D0*a2*d2*f2*g2*h2*j2*k2*m4 + &
&8.D0*b2*c*d*e2*g*h3*j2*k2*m4 + &
&8.D0*a*b*d2*e2*g*h3*j2*k2*m4 + &
&8.D0*b2*c2*e*f*g*h3*j2*k2*m4 + &
&32.D0*a*b*c*d*e*f*g*h3*j2*k2*m4 + &
&8.D0*a2*d2*e*f*g*h3*j2*k2*m4 + &
&8.D0*a*b*c2*f2*g*h3*j2*k2*m4 + &
&8.D0*a2*c*d*f2*g*h3*j2*k2*m4 + &
&b2*c2*e2*h4*j2*k2*m4 + &
&4.D0*a*b*c*d*e2*h4*j2*k2*m4 + &
&a2*d2*e2*h4*j2*k2*m4 + &
&4.D0*a*b*c2*e*f*h4*j2*k2*m4 + &
&4.D0*a2*c*d*e*f*h4*j2*k2*m4 + &
&a2*c2*f2*h4*j2*k2*m4 + &
&8.D0*b2*d2*f2*g3*h*i2*k*l*m4 + &
&24.D0*b2*d2*e*f*g2*h2*i2*k*l*m4 + &
&24.D0*b2*c*d*f2*g2*h2*i2*k*l*m4 + &
&24.D0*a*b*d2*f2*g2*h2*i2*k*l*m4 + &
&8.D0*b2*d2*e2*g*h3*i2*k*l*m4 + &
&32.D0*b2*c*d*e*f*g*h3*i2*k*l*m4 + &
&32.D0*a*b*d2*e*f*g*h3*i2*k*l*m4 + &
&8.D0*b2*c2*f2*g*h3*i2*k*l*m4 + &
&32.D0*a*b*c*d*f2*g*h3*i2*k*l*m4 + &
&8.D0*a2*d2*f2*g*h3*i2*k*l*m4 + &
&4.D0*b2*c*d*e2*h4*i2*k*l*m4 + &
&4.D0*a*b*d2*e2*h4*i2*k*l*m4 + &
&4.D0*b2*c2*e*f*h4*i2*k*l*m4 + &
&16.D0*a*b*c*d*e*f*h4*i2*k*l*m4 + &
&4.D0*a2*d2*e*f*h4*i2*k*l*m4 + &
&4.D0*a*b*c2*f2*h4*i2*k*l*m4 + &
&4.D0*a2*c*d*f2*h4*i2*k*l*m4 + &
&4.D0*b2*d2*f2*g4*i*j*k*l*m4 + &
&32.D0*b2*d2*e*f*g3*h*i*j*k*l*m4 + &
&32.D0*b2*c*d*f2*g3*h*i*j*k*l*m4 + &
&32.D0*a*b*d2*f2*g3*h*i*j*k*l*m4 + &
&24.D0*b2*d2*e2*g2*h2*i*j*k*l*m4 + &
&96.D0*b2*c*d*e*f*g2*h2*i*j*k*l*m4 + &
&96.D0*a*b*d2*e*f*g2*h2*i*j*k*l*m4 + &
&24.D0*b2*c2*f2*g2*h2*i*j*k*l*m4 + &
&96.D0*a*b*c*d*f2*g2*h2*i*j*k*l*m4 + &
&24.D0*a2*d2*f2*g2*h2*i*j*k*l*m4 + &
&32.D0*b2*c*d*e2*g*h3*i*j*k*l*m4 + &
&32.D0*a*b*d2*e2*g*h3*i*j*k*l*m4 + &
&32.D0*b2*c2*e*f*g*h3*i*j*k*l*m4 + &
&128.D0*a*b*c*d*e*f*g*h3*i*j*k*l*m4 + &
&32.D0*a2*d2*e*f*g*h3*i*j*k*l*m4 + &
&32.D0*a*b*c2*f2*g*h3*i*j*k*l*m4 + &
&32.D0*a2*c*d*f2*g*h3*i*j*k*l*m4 + &
&4.D0*b2*c2*e2*h4*i*j*k*l*m4 + &
&16.D0*a*b*c*d*e2*h4*i*j*k*l*m4 + &
&4.D0*a2*d2*e2*h4*i*j*k*l*m4 + &
&16.D0*a*b*c2*e*f*h4*i*j*k*l*m4 + &
&16.D0*a2*c*d*e*f*h4*i*j*k*l*m4 + &
&4.D0*a2*c2*f2*h4*i*j*k*l*m4 + &
&4.D0*b2*d2*e*f*g4*j2*k*l*m4 + &
&4.D0*b2*c*d*f2*g4*j2*k*l*m4 + &
&4.D0*a*b*d2*f2*g4*j2*k*l*m4 + &
&8.D0*b2*d2*e2*g3*h*j2*k*l*m4 + &
&32.D0*b2*c*d*e*f*g3*h*j2*k*l*m4 + &
&32.D0*a*b*d2*e*f*g3*h*j2*k*l*m4 + &
&8.D0*b2*c2*f2*g3*h*j2*k*l*m4 + &
&32.D0*a*b*c*d*f2*g3*h*j2*k*l*m4 + &
&8.D0*a2*d2*f2*g3*h*j2*k*l*m4 + &
&24.D0*b2*c*d*e2*g2*h2*j2*k*l*m4 + &
&24.D0*a*b*d2*e2*g2*h2*j2*k*l*m4 + &
&24.D0*b2*c2*e*f*g2*h2*j2*k*l*m4 + &
&96.D0*a*b*c*d*e*f*g2*h2*j2*k*l*m4 + &
&24.D0*a2*d2*e*f*g2*h2*j2*k*l*m4 + &
&24.D0*a*b*c2*f2*g2*h2*j2*k*l*m4 + &
&24.D0*a2*c*d*f2*g2*h2*j2*k*l*m4 + &
&8.D0*b2*c2*e2*g*h3*j2*k*l*m4 + &
&32.D0*a*b*c*d*e2*g*h3*j2*k*l*m4 + &
&8.D0*a2*d2*e2*g*h3*j2*k*l*m4 + &
&32.D0*a*b*c2*e*f*g*h3*j2*k*l*m4 + &
&32.D0*a2*c*d*e*f*g*h3*j2*k*l*m4 + &
&8.D0*a2*c2*f2*g*h3*j2*k*l*m4 + &
&4.D0*a*b*c2*e2*h4*j2*k*l*m4 + &
&4.D0*a2*c*d*e2*h4*j2*k*l*m4 + &
&4.D0*a2*c2*e*f*h4*j2*k*l*m4 + &
&b2*d2*f2*g4*i2*l2*m4 + &
&8.D0*b2*d2*e*f*g3*h*i2*l2*m4 + &
&8.D0*b2*c*d*f2*g3*h*i2*l2*m4 + &
&8.D0*a*b*d2*f2*g3*h*i2*l2*m4 + &
&6.D0*b2*d2*e2*g2*h2*i2*l2*m4 + &
&24.D0*b2*c*d*e*f*g2*h2*i2*l2*m4 + &
&24.D0*a*b*d2*e*f*g2*h2*i2*l2*m4 + &
&6.D0*b2*c2*f2*g2*h2*i2*l2*m4 + &
&24.D0*a*b*c*d*f2*g2*h2*i2*l2*m4 + &
&6.D0*a2*d2*f2*g2*h2*i2*l2*m4 + &
&8.D0*b2*c*d*e2*g*h3*i2*l2*m4 + &
&8.D0*a*b*d2*e2*g*h3*i2*l2*m4 + &
&8.D0*b2*c2*e*f*g*h3*i2*l2*m4 + &
&32.D0*a*b*c*d*e*f*g*h3*i2*l2*m4 + &
&8.D0*a2*d2*e*f*g*h3*i2*l2*m4 + &
&8.D0*a*b*c2*f2*g*h3*i2*l2*m4 + &
&8.D0*a2*c*d*f2*g*h3*i2*l2*m4 + &
&b2*c2*e2*h4*i2*l2*m4 + &
&4.D0*a*b*c*d*e2*h4*i2*l2*m4 + &
&a2*d2*e2*h4*i2*l2*m4 + &
&4.D0*a*b*c2*e*f*h4*i2*l2*m4 + &
&4.D0*a2*c*d*e*f*h4*i2*l2*m4 + &
&a2*c2*f2*h4*i2*l2*m4 + &
&4.D0*b2*d2*e*f*g4*i*j*l2*m4 + &
&4.D0*b2*c*d*f2*g4*i*j*l2*m4 + &
&4.D0*a*b*d2*f2*g4*i*j*l2*m4 + &
&8.D0*b2*d2*e2*g3*h*i*j*l2*m4 + &
&32.D0*b2*c*d*e*f*g3*h*i*j*l2*m4 + &
&32.D0*a*b*d2*e*f*g3*h*i*j*l2*m4 + &
&8.D0*b2*c2*f2*g3*h*i*j*l2*m4 + &
&32.D0*a*b*c*d*f2*g3*h*i*j*l2*m4 + &
&8.D0*a2*d2*f2*g3*h*i*j*l2*m4 + &
&24.D0*b2*c*d*e2*g2*h2*i*j*l2*m4 + &
&24.D0*a*b*d2*e2*g2*h2*i*j*l2*m4 + &
&24.D0*b2*c2*e*f*g2*h2*i*j*l2*m4 + &
&96.D0*a*b*c*d*e*f*g2*h2*i*j*l2*m4 + &
&24.D0*a2*d2*e*f*g2*h2*i*j*l2*m4 + &
&24.D0*a*b*c2*f2*g2*h2*i*j*l2*m4 + &
&24.D0*a2*c*d*f2*g2*h2*i*j*l2*m4 + &
&8.D0*b2*c2*e2*g*h3*i*j*l2*m4 + &
&32.D0*a*b*c*d*e2*g*h3*i*j*l2*m4 + &
&8.D0*a2*d2*e2*g*h3*i*j*l2*m4 + &
&32.D0*a*b*c2*e*f*g*h3*i*j*l2*m4 + &
&32.D0*a2*c*d*e*f*g*h3*i*j*l2*m4 + &
&8.D0*a2*c2*f2*g*h3*i*j*l2*m4 + &
&4.D0*a*b*c2*e2*h4*i*j*l2*m4 + &
&4.D0*a2*c*d*e2*h4*i*j*l2*m4 + &
&4.D0*a2*c2*e*f*h4*i*j*l2*m4 + &
&b2*d2*e2*g4*j2*l2*m4 + &
&4.D0*b2*c*d*e*f*g4*j2*l2*m4 + &
&4.D0*a*b*d2*e*f*g4*j2*l2*m4 + &
&b2*c2*f2*g4*j2*l2*m4 + &
&4.D0*a*b*c*d*f2*g4*j2*l2*m4 + &
&a2*d2*f2*g4*j2*l2*m4 + &
&8.D0*b2*c*d*e2*g3*h*j2*l2*m4 + &
&8.D0*a*b*d2*e2*g3*h*j2*l2*m4 + &
&8.D0*b2*c2*e*f*g3*h*j2*l2*m4 + &
&32.D0*a*b*c*d*e*f*g3*h*j2*l2*m4 + &
&8.D0*a2*d2*e*f*g3*h*j2*l2*m4 + &
&8.D0*a*b*c2*f2*g3*h*j2*l2*m4 + &
&8.D0*a2*c*d*f2*g3*h*j2*l2*m4 + &
&6.D0*b2*c2*e2*g2*h2*j2*l2*m4 + &
&24.D0*a*b*c*d*e2*g2*h2*j2*l2*m4 + &
&6.D0*a2*d2*e2*g2*h2*j2*l2*m4 + &
&24.D0*a*b*c2*e*f*g2*h2*j2*l2*m4 + &
&24.D0*a2*c*d*e*f*g2*h2*j2*l2*m4 + &
&6.D0*a2*c2*f2*g2*h2*j2*l2*m4 + &
&8.D0*a*b*c2*e2*g*h3*j2*l2*m4 + &
&8.D0*a2*c*d*e2*g*h3*j2*l2*m4 + &
&8.D0*a2*c2*e*f*g*h3*j2*l2*m4 + &
&a2*c2*e2*h4*j2*l2*m4 + &
&16.D0*b2*d2*f2*g3*h*i2*k2*m3*n + &
&48.D0*b2*d2*e*f*g2*h2*i2*k2*m3*n + &
&48.D0*b2*c*d*f2*g2*h2*i2*k2*m3*n + &
&48.D0*a*b*d2*f2*g2*h2*i2*k2*m3*n + &
&16.D0*b2*d2*e2*g*h3*i2*k2*m3*n + &
&64.D0*b2*c*d*e*f*g*h3*i2*k2*m3*n + &
&64.D0*a*b*d2*e*f*g*h3*i2*k2*m3*n + &
&16.D0*b2*c2*f2*g*h3*i2*k2*m3*n + &
&64.D0*a*b*c*d*f2*g*h3*i2*k2*m3*n + &
&16.D0*a2*d2*f2*g*h3*i2*k2*m3*n + &
&8.D0*b2*c*d*e2*h4*i2*k2*m3*n + &
&8.D0*a*b*d2*e2*h4*i2*k2*m3*n + &
&8.D0*b2*c2*e*f*h4*i2*k2*m3*n + &
&32.D0*a*b*c*d*e*f*h4*i2*k2*m3*n + &
&8.D0*a2*d2*e*f*h4*i2*k2*m3*n + &
&8.D0*a*b*c2*f2*h4*i2*k2*m3*n + &
&8.D0*a2*c*d*f2*h4*i2*k2*m3*n + &
&8.D0*b2*d2*f2*g4*i*j*k2*m3*n + &
&64.D0*b2*d2*e*f*g3*h*i*j*k2*m3*n + &
&64.D0*b2*c*d*f2*g3*h*i*j*k2*m3*n + &
&64.D0*a*b*d2*f2*g3*h*i*j*k2*m3*n + &
&48.D0*b2*d2*e2*g2*h2*i*j*k2*m3*n + &
&192.D0*b2*c*d*e*f*g2*h2*i*j*k2*m3*n + &
&192.D0*a*b*d2*e*f*g2*h2*i*j*k2*m3*n + &
&48.D0*b2*c2*f2*g2*h2*i*j*k2*m3*n + &
&192.D0*a*b*c*d*f2*g2*h2*i*j*k2*m3*n + &
&48.D0*a2*d2*f2*g2*h2*i*j*k2*m3*n + &
&64.D0*b2*c*d*e2*g*h3*i*j*k2*m3*n + &
&64.D0*a*b*d2*e2*g*h3*i*j*k2*m3*n + &
&64.D0*b2*c2*e*f*g*h3*i*j*k2*m3*n + &
&256.D0*a*b*c*d*e*f*g*h3*i*j*k2*m3*n + &
&64.D0*a2*d2*e*f*g*h3*i*j*k2*m3*n + &
&64.D0*a*b*c2*f2*g*h3*i*j*k2*m3*n + &
&64.D0*a2*c*d*f2*g*h3*i*j*k2*m3*n + &
&8.D0*b2*c2*e2*h4*i*j*k2*m3*n + &
&32.D0*a*b*c*d*e2*h4*i*j*k2*m3*n + &
&8.D0*a2*d2*e2*h4*i*j*k2*m3*n + &
&32.D0*a*b*c2*e*f*h4*i*j*k2*m3*n + &
&32.D0*a2*c*d*e*f*h4*i*j*k2*m3*n + &
&8.D0*a2*c2*f2*h4*i*j*k2*m3*n + &
&8.D0*b2*d2*e*f*g4*j2*k2*m3*n + &
&8.D0*b2*c*d*f2*g4*j2*k2*m3*n + &
&8.D0*a*b*d2*f2*g4*j2*k2*m3*n + &
&16.D0*b2*d2*e2*g3*h*j2*k2*m3*n + &
&64.D0*b2*c*d*e*f*g3*h*j2*k2*m3*n + &
&64.D0*a*b*d2*e*f*g3*h*j2*k2*m3*n + &
&16.D0*b2*c2*f2*g3*h*j2*k2*m3*n + &
&64.D0*a*b*c*d*f2*g3*h*j2*k2*m3*n + &
&16.D0*a2*d2*f2*g3*h*j2*k2*m3*n + &
&48.D0*b2*c*d*e2*g2*h2*j2*k2*m3*n + &
&48.D0*a*b*d2*e2*g2*h2*j2*k2*m3*n + &
&48.D0*b2*c2*e*f*g2*h2*j2*k2*m3*n + &
&192.D0*a*b*c*d*e*f*g2*h2*j2*k2*m3*n + &
&48.D0*a2*d2*e*f*g2*h2*j2*k2*m3*n + &
&48.D0*a*b*c2*f2*g2*h2*j2*k2*m3*n + &
&48.D0*a2*c*d*f2*g2*h2*j2*k2*m3*n + &
&16.D0*b2*c2*e2*g*h3*j2*k2*m3*n + &
&64.D0*a*b*c*d*e2*g*h3*j2*k2*m3*n + &
&16.D0*a2*d2*e2*g*h3*j2*k2*m3*n + &
&64.D0*a*b*c2*e*f*g*h3*j2*k2*m3*n + &
&64.D0*a2*c*d*e*f*g*h3*j2*k2*m3*n + &
&16.D0*a2*c2*f2*g*h3*j2*k2*m3*n + &
&8.D0*a*b*c2*e2*h4*j2*k2*m3*n + &
&8.D0*a2*c*d*e2*h4*j2*k2*m3*n + &
&8.D0*a2*c2*e*f*h4*j2*k2*m3*n + &
&8.D0*b2*d2*f2*g4*i2*k*l*m3*n + &
&64.D0*b2*d2*e*f*g3*h*i2*k*l*m3*n + &
&64.D0*b2*c*d*f2*g3*h*i2*k*l*m3*n + &
&64.D0*a*b*d2*f2*g3*h*i2*k*l*m3*n + &
&48.D0*b2*d2*e2*g2*h2*i2*k*l*m3*n + &
&192.D0*b2*c*d*e*f*g2*h2*i2*k*l*m3*n + &
&192.D0*a*b*d2*e*f*g2*h2*i2*k*l*m3*n + &
&48.D0*b2*c2*f2*g2*h2*i2*k*l*m3*n + &
&192.D0*a*b*c*d*f2*g2*h2*i2*k*l*m3*n + &
&48.D0*a2*d2*f2*g2*h2*i2*k*l*m3*n + &
&64.D0*b2*c*d*e2*g*h3*i2*k*l*m3*n + &
&64.D0*a*b*d2*e2*g*h3*i2*k*l*m3*n + &
&64.D0*b2*c2*e*f*g*h3*i2*k*l*m3*n + &
&256.D0*a*b*c*d*e*f*g*h3*i2*k*l*m3*n + &
&64.D0*a2*d2*e*f*g*h3*i2*k*l*m3*n + &
&64.D0*a*b*c2*f2*g*h3*i2*k*l*m3*n + &
&64.D0*a2*c*d*f2*g*h3*i2*k*l*m3*n + &
&8.D0*b2*c2*e2*h4*i2*k*l*m3*n + &
&32.D0*a*b*c*d*e2*h4*i2*k*l*m3*n + &
&8.D0*a2*d2*e2*h4*i2*k*l*m3*n + &
&32.D0*a*b*c2*e*f*h4*i2*k*l*m3*n + &
&32.D0*a2*c*d*e*f*h4*i2*k*l*m3*n + &
&8.D0*a2*c2*f2*h4*i2*k*l*m3*n + &
&32.D0*b2*d2*e*f*g4*i*j*k*l*m3*n + &
&32.D0*b2*c*d*f2*g4*i*j*k*l*m3*n + &
&32.D0*a*b*d2*f2*g4*i*j*k*l*m3*n + &
&64.D0*b2*d2*e2*g3*h*i*j*k*l*m3*n + &
&256.D0*b2*c*d*e*f*g3*h*i*j*k*l*m3*n + &
&256.D0*a*b*d2*e*f*g3*h*i*j*k*l*m3*n + &
&64.D0*b2*c2*f2*g3*h*i*j*k*l*m3*n + &
&256.D0*a*b*c*d*f2*g3*h*i*j*k*l*m3*n + &
&64.D0*a2*d2*f2*g3*h*i*j*k*l*m3*n + &
&192.D0*b2*c*d*e2*g2*h2*i*j*k*l*m3*n + &
&192.D0*a*b*d2*e2*g2*h2*i*j*k*l*m3*n + &
&192.D0*b2*c2*e*f*g2*h2*i*j*k*l*m3*n + &
&768.D0*a*b*c*d*e*f*g2*h2*i*j*k*l*m3*n + &
&192.D0*a2*d2*e*f*g2*h2*i*j*k*l*m3*n + &
&192.D0*a*b*c2*f2*g2*h2*i*j*k*l*m3*n + &
&192.D0*a2*c*d*f2*g2*h2*i*j*k*l*m3*n + &
&64.D0*b2*c2*e2*g*h3*i*j*k*l*m3*n + &
&256.D0*a*b*c*d*e2*g*h3*i*j*k*l*m3*n + &
&64.D0*a2*d2*e2*g*h3*i*j*k*l*m3*n + &
&256.D0*a*b*c2*e*f*g*h3*i*j*k*l*m3*n + &
&256.D0*a2*c*d*e*f*g*h3*i*j*k*l*m3*n + &
&64.D0*a2*c2*f2*g*h3*i*j*k*l*m3*n + &
&32.D0*a*b*c2*e2*h4*i*j*k*l*m3*n + &
&32.D0*a2*c*d*e2*h4*i*j*k*l*m3*n + &
&32.D0*a2*c2*e*f*h4*i*j*k*l*m3*n + &
&8.D0*b2*d2*e2*g4*j2*k*l*m3*n + &
&32.D0*b2*c*d*e*f*g4*j2*k*l*m3*n + &
&32.D0*a*b*d2*e*f*g4*j2*k*l*m3*n + &
&8.D0*b2*c2*f2*g4*j2*k*l*m3*n + &
&32.D0*a*b*c*d*f2*g4*j2*k*l*m3*n + &
&8.D0*a2*d2*f2*g4*j2*k*l*m3*n + &
&64.D0*b2*c*d*e2*g3*h*j2*k*l*m3*n + &
&64.D0*a*b*d2*e2*g3*h*j2*k*l*m3*n + &
&64.D0*b2*c2*e*f*g3*h*j2*k*l*m3*n + &
&256.D0*a*b*c*d*e*f*g3*h*j2*k*l*m3*n + &
&64.D0*a2*d2*e*f*g3*h*j2*k*l*m3*n + &
&64.D0*a*b*c2*f2*g3*h*j2*k*l*m3*n + &
&64.D0*a2*c*d*f2*g3*h*j2*k*l*m3*n + &
&48.D0*b2*c2*e2*g2*h2*j2*k*l*m3*n + &
&192.D0*a*b*c*d*e2*g2*h2*j2*k*l*m3*n + &
&48.D0*a2*d2*e2*g2*h2*j2*k*l*m3*n + &
&192.D0*a*b*c2*e*f*g2*h2*j2*k*l*m3*n + &
&192.D0*a2*c*d*e*f*g2*h2*j2*k*l*m3*n + &
&48.D0*a2*c2*f2*g2*h2*j2*k*l*m3*n + &
&64.D0*a*b*c2*e2*g*h3*j2*k*l*m3*n + &
&64.D0*a2*c*d*e2*g*h3*j2*k*l*m3*n + &
&64.D0*a2*c2*e*f*g*h3*j2*k*l*m3*n + &
&8.D0*a2*c2*e2*h4*j2*k*l*m3*n + &
&8.D0*b2*d2*e*f*g4*i2*l2*m3*n + &
&8.D0*b2*c*d*f2*g4*i2*l2*m3*n + &
&8.D0*a*b*d2*f2*g4*i2*l2*m3*n + &
&16.D0*b2*d2*e2*g3*h*i2*l2*m3*n + &
&64.D0*b2*c*d*e*f*g3*h*i2*l2*m3*n + &
&64.D0*a*b*d2*e*f*g3*h*i2*l2*m3*n + &
&16.D0*b2*c2*f2*g3*h*i2*l2*m3*n + &
&64.D0*a*b*c*d*f2*g3*h*i2*l2*m3*n + &
&16.D0*a2*d2*f2*g3*h*i2*l2*m3*n + &
&48.D0*b2*c*d*e2*g2*h2*i2*l2*m3*n + &
&48.D0*a*b*d2*e2*g2*h2*i2*l2*m3*n + &
&48.D0*b2*c2*e*f*g2*h2*i2*l2*m3*n + &
&192.D0*a*b*c*d*e*f*g2*h2*i2*l2*m3*n + &
&48.D0*a2*d2*e*f*g2*h2*i2*l2*m3*n + &
&48.D0*a*b*c2*f2*g2*h2*i2*l2*m3*n + &
&48.D0*a2*c*d*f2*g2*h2*i2*l2*m3*n + &
&16.D0*b2*c2*e2*g*h3*i2*l2*m3*n + &
&64.D0*a*b*c*d*e2*g*h3*i2*l2*m3*n + &
&16.D0*a2*d2*e2*g*h3*i2*l2*m3*n + &
&64.D0*a*b*c2*e*f*g*h3*i2*l2*m3*n + &
&64.D0*a2*c*d*e*f*g*h3*i2*l2*m3*n + &
&16.D0*a2*c2*f2*g*h3*i2*l2*m3*n + &
&8.D0*a*b*c2*e2*h4*i2*l2*m3*n + &
&8.D0*a2*c*d*e2*h4*i2*l2*m3*n + &
&8.D0*a2*c2*e*f*h4*i2*l2*m3*n + &
&8.D0*b2*d2*e2*g4*i*j*l2*m3*n + &
&32.D0*b2*c*d*e*f*g4*i*j*l2*m3*n + &
&32.D0*a*b*d2*e*f*g4*i*j*l2*m3*n + &
&8.D0*b2*c2*f2*g4*i*j*l2*m3*n + &
&32.D0*a*b*c*d*f2*g4*i*j*l2*m3*n + &
&8.D0*a2*d2*f2*g4*i*j*l2*m3*n + &
&64.D0*b2*c*d*e2*g3*h*i*j*l2*m3*n + &
&64.D0*a*b*d2*e2*g3*h*i*j*l2*m3*n + &
&64.D0*b2*c2*e*f*g3*h*i*j*l2*m3*n + &
&256.D0*a*b*c*d*e*f*g3*h*i*j*l2*m3*n + &
&64.D0*a2*d2*e*f*g3*h*i*j*l2*m3*n + &
&64.D0*a*b*c2*f2*g3*h*i*j*l2*m3*n + &
&64.D0*a2*c*d*f2*g3*h*i*j*l2*m3*n + &
&48.D0*b2*c2*e2*g2*h2*i*j*l2*m3*n + &
&192.D0*a*b*c*d*e2*g2*h2*i*j*l2*m3*n + &
&48.D0*a2*d2*e2*g2*h2*i*j*l2*m3*n + &
&192.D0*a*b*c2*e*f*g2*h2*i*j*l2*m3*n + &
&192.D0*a2*c*d*e*f*g2*h2*i*j*l2*m3*n + &
&48.D0*a2*c2*f2*g2*h2*i*j*l2*m3*n + &
&64.D0*a*b*c2*e2*g*h3*i*j*l2*m3*n + &
&64.D0*a2*c*d*e2*g*h3*i*j*l2*m3*n + &
&64.D0*a2*c2*e*f*g*h3*i*j*l2*m3*n + &
&8.D0*a2*c2*e2*h4*i*j*l2*m3*n + &
&8.D0*b2*c*d*e2*g4*j2*l2*m3*n + &
&8.D0*a*b*d2*e2*g4*j2*l2*m3*n + &
&8.D0*b2*c2*e*f*g4*j2*l2*m3*n + &
&32.D0*a*b*c*d*e*f*g4*j2*l2*m3*n + &
&8.D0*a2*d2*e*f*g4*j2*l2*m3*n + &
&8.D0*a*b*c2*f2*g4*j2*l2*m3*n + &
&8.D0*a2*c*d*f2*g4*j2*l2*m3*n + &
&16.D0*b2*c2*e2*g3*h*j2*l2*m3*n + &
&64.D0*a*b*c*d*e2*g3*h*j2*l2*m3*n + &
&16.D0*a2*d2*e2*g3*h*j2*l2*m3*n + &
&64.D0*a*b*c2*e*f*g3*h*j2*l2*m3*n + &
&64.D0*a2*c*d*e*f*g3*h*j2*l2*m3*n + &
&16.D0*a2*c2*f2*g3*h*j2*l2*m3*n + &
&48.D0*a*b*c2*e2*g2*h2*j2*l2*m3*n + &
&48.D0*a2*c*d*e2*g2*h2*j2*l2*m3*n + &
&48.D0*a2*c2*e*f*g2*h2*j2*l2*m3*n + &
&16.D0*a2*c2*e2*g*h3*j2*l2*m3*n + &
&6.D0*b2*d2*f2*g4*i2*k2*m2*n2 + &
&48.D0*b2*d2*e*f*g3*h*i2*k2*m2*n2 + &
&48.D0*b2*c*d*f2*g3*h*i2*k2*m2*n2 + &
&48.D0*a*b*d2*f2*g3*h*i2*k2*m2*n2 + &
&36.D0*b2*d2*e2*g2*h2*i2*k2*m2*n2 + &
&144.D0*b2*c*d*e*f*g2*h2*i2*k2*m2*n2 + &
&144.D0*a*b*d2*e*f*g2*h2*i2*k2*m2*n2 + &
&36.D0*b2*c2*f2*g2*h2*i2*k2*m2*n2 + &
&144.D0*a*b*c*d*f2*g2*h2*i2*k2*m2*n2 + &
&36.D0*a2*d2*f2*g2*h2*i2*k2*m2*n2 + &
&48.D0*b2*c*d*e2*g*h3*i2*k2*m2*n2 + &
&48.D0*a*b*d2*e2*g*h3*i2*k2*m2*n2 + &
&48.D0*b2*c2*e*f*g*h3*i2*k2*m2*n2 + &
&192.D0*a*b*c*d*e*f*g*h3*i2*k2*m2*n2 + &
&48.D0*a2*d2*e*f*g*h3*i2*k2*m2*n2 + &
&48.D0*a*b*c2*f2*g*h3*i2*k2*m2*n2 + &
&48.D0*a2*c*d*f2*g*h3*i2*k2*m2*n2 + &
&6.D0*b2*c2*e2*h4*i2*k2*m2*n2 + &
&24.D0*a*b*c*d*e2*h4*i2*k2*m2*n2 + &
&6.D0*a2*d2*e2*h4*i2*k2*m2*n2 + &
&24.D0*a*b*c2*e*f*h4*i2*k2*m2*n2 + &
&24.D0*a2*c*d*e*f*h4*i2*k2*m2*n2 + &
&6.D0*a2*c2*f2*h4*i2*k2*m2*n2 + &
&24.D0*b2*d2*e*f*g4*i*j*k2*m2*n2 + &
&24.D0*b2*c*d*f2*g4*i*j*k2*m2*n2 + &
&24.D0*a*b*d2*f2*g4*i*j*k2*m2*n2 + &
&48.D0*b2*d2*e2*g3*h*i*j*k2*m2*n2 + &
&192.D0*b2*c*d*e*f*g3*h*i*j*k2*m2*n2 + &
&192.D0*a*b*d2*e*f*g3*h*i*j*k2*m2*n2 + &
&48.D0*b2*c2*f2*g3*h*i*j*k2*m2*n2 + &
&192.D0*a*b*c*d*f2*g3*h*i*j*k2*m2*n2 + &
&48.D0*a2*d2*f2*g3*h*i*j*k2*m2*n2 + &
&144.D0*b2*c*d*e2*g2*h2*i*j*k2*m2*n2 + &
&144.D0*a*b*d2*e2*g2*h2*i*j*k2*m2*n2 + &
&144.D0*b2*c2*e*f*g2*h2*i*j*k2*m2*n2 + &
&576.D0*a*b*c*d*e*f*g2*h2*i*j*k2*m2*n2 + &
&144.D0*a2*d2*e*f*g2*h2*i*j*k2*m2*n2 + &
&144.D0*a*b*c2*f2*g2*h2*i*j*k2*m2*n2 + &
&144.D0*a2*c*d*f2*g2*h2*i*j*k2*m2*n2 + &
&48.D0*b2*c2*e2*g*h3*i*j*k2*m2*n2 + &
&192.D0*a*b*c*d*e2*g*h3*i*j*k2*m2*n2 + &
&48.D0*a2*d2*e2*g*h3*i*j*k2*m2*n2 + &
&192.D0*a*b*c2*e*f*g*h3*i*j*k2*m2*n2 + &
&192.D0*a2*c*d*e*f*g*h3*i*j*k2*m2*n2 + &
&48.D0*a2*c2*f2*g*h3*i*j*k2*m2*n2 + &
&24.D0*a*b*c2*e2*h4*i*j*k2*m2*n2 + &
&24.D0*a2*c*d*e2*h4*i*j*k2*m2*n2 + &
&24.D0*a2*c2*e*f*h4*i*j*k2*m2*n2 + &
&6.D0*b2*d2*e2*g4*j2*k2*m2*n2 + &
&24.D0*b2*c*d*e*f*g4*j2*k2*m2*n2 + &
&24.D0*a*b*d2*e*f*g4*j2*k2*m2*n2 + &
&6.D0*b2*c2*f2*g4*j2*k2*m2*n2 + &
&24.D0*a*b*c*d*f2*g4*j2*k2*m2*n2 + &
&6.D0*a2*d2*f2*g4*j2*k2*m2*n2 + &
&48.D0*b2*c*d*e2*g3*h*j2*k2*m2*n2 + &
&48.D0*a*b*d2*e2*g3*h*j2*k2*m2*n2 + &
&48.D0*b2*c2*e*f*g3*h*j2*k2*m2*n2 + &
&192.D0*a*b*c*d*e*f*g3*h*j2*k2*m2*n2 + &
&48.D0*a2*d2*e*f*g3*h*j2*k2*m2*n2 + &
&48.D0*a*b*c2*f2*g3*h*j2*k2*m2*n2 + &
&48.D0*a2*c*d*f2*g3*h*j2*k2*m2*n2 + &
&36.D0*b2*c2*e2*g2*h2*j2*k2*m2*n2 + &
&144.D0*a*b*c*d*e2*g2*h2*j2*k2*m2*n2 + &
&36.D0*a2*d2*e2*g2*h2*j2*k2*m2*n2 + &
&144.D0*a*b*c2*e*f*g2*h2*j2*k2*m2*n2 + &
&144.D0*a2*c*d*e*f*g2*h2*j2*k2*m2*n2 + &
&36.D0*a2*c2*f2*g2*h2*j2*k2*m2*n2 + &
&48.D0*a*b*c2*e2*g*h3*j2*k2*m2*n2 + &
&48.D0*a2*c*d*e2*g*h3*j2*k2*m2*n2 + &
&48.D0*a2*c2*e*f*g*h3*j2*k2*m2*n2 + &
&6.D0*a2*c2*e2*h4*j2*k2*m2*n2 + &
&24.D0*b2*d2*e*f*g4*i2*k*l*m2*n2 + &
&24.D0*b2*c*d*f2*g4*i2*k*l*m2*n2 + &
&24.D0*a*b*d2*f2*g4*i2*k*l*m2*n2 + &
&48.D0*b2*d2*e2*g3*h*i2*k*l*m2*n2 + &
&192.D0*b2*c*d*e*f*g3*h*i2*k*l*m2*n2 + &
&192.D0*a*b*d2*e*f*g3*h*i2*k*l*m2*n2 + &
&48.D0*b2*c2*f2*g3*h*i2*k*l*m2*n2 + &
&192.D0*a*b*c*d*f2*g3*h*i2*k*l*m2*n2 + &
&48.D0*a2*d2*f2*g3*h*i2*k*l*m2*n2 + &
&144.D0*b2*c*d*e2*g2*h2*i2*k*l*m2*n2 + &
&144.D0*a*b*d2*e2*g2*h2*i2*k*l*m2*n2 + &
&144.D0*b2*c2*e*f*g2*h2*i2*k*l*m2*n2 + &
&576.D0*a*b*c*d*e*f*g2*h2*i2*k*l*m2*n2 + &
&144.D0*a2*d2*e*f*g2*h2*i2*k*l*m2*n2 + &
&144.D0*a*b*c2*f2*g2*h2*i2*k*l*m2*n2 + &
&144.D0*a2*c*d*f2*g2*h2*i2*k*l*m2*n2 + &
&48.D0*b2*c2*e2*g*h3*i2*k*l*m2*n2 + &
&192.D0*a*b*c*d*e2*g*h3*i2*k*l*m2*n2 + &
&48.D0*a2*d2*e2*g*h3*i2*k*l*m2*n2 + &
&192.D0*a*b*c2*e*f*g*h3*i2*k*l*m2*n2 + &
&192.D0*a2*c*d*e*f*g*h3*i2*k*l*m2*n2 + &
&48.D0*a2*c2*f2*g*h3*i2*k*l*m2*n2 + &
&24.D0*a*b*c2*e2*h4*i2*k*l*m2*n2 + &
&24.D0*a2*c*d*e2*h4*i2*k*l*m2*n2 + &
&24.D0*a2*c2*e*f*h4*i2*k*l*m2*n2 + &
&24.D0*b2*d2*e2*g4*i*j*k*l*m2*n2 + &
&96.D0*b2*c*d*e*f*g4*i*j*k*l*m2*n2 + &
&96.D0*a*b*d2*e*f*g4*i*j*k*l*m2*n2 + &
&24.D0*b2*c2*f2*g4*i*j*k*l*m2*n2 + &
&96.D0*a*b*c*d*f2*g4*i*j*k*l*m2*n2 + &
&24.D0*a2*d2*f2*g4*i*j*k*l*m2*n2 + &
&192.D0*b2*c*d*e2*g3*h*i*j*k*l*m2*n2 + &
&192.D0*a*b*d2*e2*g3*h*i*j*k*l*m2*n2 + &
&192.D0*b2*c2*e*f*g3*h*i*j*k*l*m2*n2 + &
&768.D0*a*b*c*d*e*f*g3*h*i*j*k*l*m2*n2 + &
&192.D0*a2*d2*e*f*g3*h*i*j*k*l*m2*n2 + &
&192.D0*a*b*c2*f2*g3*h*i*j*k*l*m2*n2 + &
&192.D0*a2*c*d*f2*g3*h*i*j*k*l*m2*n2 + &
&144.D0*b2*c2*e2*g2*h2*i*j*k*l*m2*n2 + &
&576.D0*a*b*c*d*e2*g2*h2*i*j*k*l*m2*n2 + &
&144.D0*a2*d2*e2*g2*h2*i*j*k*l*m2*n2 + &
&576.D0*a*b*c2*e*f*g2*h2*i*j*k*l*m2*n2 + &
&576.D0*a2*c*d*e*f*g2*h2*i*j*k*l*m2*n2 + &
&144.D0*a2*c2*f2*g2*h2*i*j*k*l*m2*n2 + &
&192.D0*a*b*c2*e2*g*h3*i*j*k*l*m2*n2 + &
&192.D0*a2*c*d*e2*g*h3*i*j*k*l*m2*n2 + &
&192.D0*a2*c2*e*f*g*h3*i*j*k*l*m2*n2 + &
&24.D0*a2*c2*e2*h4*i*j*k*l*m2*n2 + &
&24.D0*b2*c*d*e2*g4*j2*k*l*m2*n2 + &
&24.D0*a*b*d2*e2*g4*j2*k*l*m2*n2 + &
&24.D0*b2*c2*e*f*g4*j2*k*l*m2*n2 + &
&96.D0*a*b*c*d*e*f*g4*j2*k*l*m2*n2 + &
&24.D0*a2*d2*e*f*g4*j2*k*l*m2*n2 + &
&24.D0*a*b*c2*f2*g4*j2*k*l*m2*n2 + &
&24.D0*a2*c*d*f2*g4*j2*k*l*m2*n2 + &
&48.D0*b2*c2*e2*g3*h*j2*k*l*m2*n2 + &
&192.D0*a*b*c*d*e2*g3*h*j2*k*l*m2*n2 + &
&48.D0*a2*d2*e2*g3*h*j2*k*l*m2*n2 + &
&192.D0*a*b*c2*e*f*g3*h*j2*k*l*m2*n2 + &
&192.D0*a2*c*d*e*f*g3*h*j2*k*l*m2*n2 + &
&48.D0*a2*c2*f2*g3*h*j2*k*l*m2*n2 + &
&144.D0*a*b*c2*e2*g2*h2*j2*k*l*m2*n2 + &
&144.D0*a2*c*d*e2*g2*h2*j2*k*l*m2*n2 + &
&144.D0*a2*c2*e*f*g2*h2*j2*k*l*m2*n2 + &
&48.D0*a2*c2*e2*g*h3*j2*k*l*m2*n2 + &
&6.D0*b2*d2*e2*g4*i2*l2*m2*n2 + &
&24.D0*b2*c*d*e*f*g4*i2*l2*m2*n2 + &
&24.D0*a*b*d2*e*f*g4*i2*l2*m2*n2 + &
&6.D0*b2*c2*f2*g4*i2*l2*m2*n2 + &
&24.D0*a*b*c*d*f2*g4*i2*l2*m2*n2 + &
&6.D0*a2*d2*f2*g4*i2*l2*m2*n2 + &
&48.D0*b2*c*d*e2*g3*h*i2*l2*m2*n2 + &
&48.D0*a*b*d2*e2*g3*h*i2*l2*m2*n2 + &
&48.D0*b2*c2*e*f*g3*h*i2*l2*m2*n2 + &
&192.D0*a*b*c*d*e*f*g3*h*i2*l2*m2*n2 + &
&48.D0*a2*d2*e*f*g3*h*i2*l2*m2*n2 + &
&48.D0*a*b*c2*f2*g3*h*i2*l2*m2*n2 + &
&48.D0*a2*c*d*f2*g3*h*i2*l2*m2*n2 + &
&36.D0*b2*c2*e2*g2*h2*i2*l2*m2*n2 + &
&144.D0*a*b*c*d*e2*g2*h2*i2*l2*m2*n2 + &
&36.D0*a2*d2*e2*g2*h2*i2*l2*m2*n2 + &
&144.D0*a*b*c2*e*f*g2*h2*i2*l2*m2*n2 + &
&144.D0*a2*c*d*e*f*g2*h2*i2*l2*m2*n2 + &
&36.D0*a2*c2*f2*g2*h2*i2*l2*m2*n2 + &
&48.D0*a*b*c2*e2*g*h3*i2*l2*m2*n2 + &
&48.D0*a2*c*d*e2*g*h3*i2*l2*m2*n2 + &
&48.D0*a2*c2*e*f*g*h3*i2*l2*m2*n2 + &
&6.D0*a2*c2*e2*h4*i2*l2*m2*n2 + &
&24.D0*b2*c*d*e2*g4*i*j*l2*m2*n2 + &
&24.D0*a*b*d2*e2*g4*i*j*l2*m2*n2 + &
&24.D0*b2*c2*e*f*g4*i*j*l2*m2*n2 + &
&96.D0*a*b*c*d*e*f*g4*i*j*l2*m2*n2 + &
&24.D0*a2*d2*e*f*g4*i*j*l2*m2*n2 + &
&24.D0*a*b*c2*f2*g4*i*j*l2*m2*n2 + &
&24.D0*a2*c*d*f2*g4*i*j*l2*m2*n2 + &
&48.D0*b2*c2*e2*g3*h*i*j*l2*m2*n2 + &
&192.D0*a*b*c*d*e2*g3*h*i*j*l2*m2*n2 + &
&48.D0*a2*d2*e2*g3*h*i*j*l2*m2*n2 + &
&192.D0*a*b*c2*e*f*g3*h*i*j*l2*m2*n2 + &
&192.D0*a2*c*d*e*f*g3*h*i*j*l2*m2*n2 + &
&48.D0*a2*c2*f2*g3*h*i*j*l2*m2*n2 + &
&144.D0*a*b*c2*e2*g2*h2*i*j*l2*m2*n2 + &
&144.D0*a2*c*d*e2*g2*h2*i*j*l2*m2*n2 + &
&144.D0*a2*c2*e*f*g2*h2*i*j*l2*m2*n2 + &
&48.D0*a2*c2*e2*g*h3*i*j*l2*m2*n2 + &
&6.D0*b2*c2*e2*g4*j2*l2*m2*n2 + &
&24.D0*a*b*c*d*e2*g4*j2*l2*m2*n2 + &
&6.D0*a2*d2*e2*g4*j2*l2*m2*n2 + &
&24.D0*a*b*c2*e*f*g4*j2*l2*m2*n2 + &
&24.D0*a2*c*d*e*f*g4*j2*l2*m2*n2 + &
&6.D0*a2*c2*f2*g4*j2*l2*m2*n2 + &
&48.D0*a*b*c2*e2*g3*h*j2*l2*m2*n2 + &
&48.D0*a2*c*d*e2*g3*h*j2*l2*m2*n2 + &
&48.D0*a2*c2*e*f*g3*h*j2*l2*m2*n2 + &
&36.D0*a2*c2*e2*g2*h2*j2*l2*m2*n2 + &
&8.D0*b2*d2*e*f*g4*i2*k2*m*n3 + &
&8.D0*b2*c*d*f2*g4*i2*k2*m*n3 + &
&8.D0*a*b*d2*f2*g4*i2*k2*m*n3 + &
&16.D0*b2*d2*e2*g3*h*i2*k2*m*n3 + &
&64.D0*b2*c*d*e*f*g3*h*i2*k2*m*n3 + &
&64.D0*a*b*d2*e*f*g3*h*i2*k2*m*n3 + &
&16.D0*b2*c2*f2*g3*h*i2*k2*m*n3 + &
&64.D0*a*b*c*d*f2*g3*h*i2*k2*m*n3 + &
&16.D0*a2*d2*f2*g3*h*i2*k2*m*n3 + &
&48.D0*b2*c*d*e2*g2*h2*i2*k2*m*n3 + &
&48.D0*a*b*d2*e2*g2*h2*i2*k2*m*n3 + &
&48.D0*b2*c2*e*f*g2*h2*i2*k2*m*n3 + &
&192.D0*a*b*c*d*e*f*g2*h2*i2*k2*m*n3 + &
&48.D0*a2*d2*e*f*g2*h2*i2*k2*m*n3 + &
&48.D0*a*b*c2*f2*g2*h2*i2*k2*m*n3 + &
&48.D0*a2*c*d*f2*g2*h2*i2*k2*m*n3 + &
&16.D0*b2*c2*e2*g*h3*i2*k2*m*n3 + &
&64.D0*a*b*c*d*e2*g*h3*i2*k2*m*n3 + &
&16.D0*a2*d2*e2*g*h3*i2*k2*m*n3 + &
&64.D0*a*b*c2*e*f*g*h3*i2*k2*m*n3 + &
&64.D0*a2*c*d*e*f*g*h3*i2*k2*m*n3 + &
&16.D0*a2*c2*f2*g*h3*i2*k2*m*n3 + &
&8.D0*a*b*c2*e2*h4*i2*k2*m*n3 + &
&8.D0*a2*c*d*e2*h4*i2*k2*m*n3 + &
&8.D0*a2*c2*e*f*h4*i2*k2*m*n3 + &
&8.D0*b2*d2*e2*g4*i*j*k2*m*n3 + &
&32.D0*b2*c*d*e*f*g4*i*j*k2*m*n3 + &
&32.D0*a*b*d2*e*f*g4*i*j*k2*m*n3 + &
&8.D0*b2*c2*f2*g4*i*j*k2*m*n3 + &
&32.D0*a*b*c*d*f2*g4*i*j*k2*m*n3 + &
&8.D0*a2*d2*f2*g4*i*j*k2*m*n3 + &
&64.D0*b2*c*d*e2*g3*h*i*j*k2*m*n3 + &
&64.D0*a*b*d2*e2*g3*h*i*j*k2*m*n3 + &
&64.D0*b2*c2*e*f*g3*h*i*j*k2*m*n3 + &
&256.D0*a*b*c*d*e*f*g3*h*i*j*k2*m*n3 + &
&64.D0*a2*d2*e*f*g3*h*i*j*k2*m*n3 + &
&64.D0*a*b*c2*f2*g3*h*i*j*k2*m*n3 + &
&64.D0*a2*c*d*f2*g3*h*i*j*k2*m*n3 + &
&48.D0*b2*c2*e2*g2*h2*i*j*k2*m*n3 + &
&192.D0*a*b*c*d*e2*g2*h2*i*j*k2*m*n3 + &
&48.D0*a2*d2*e2*g2*h2*i*j*k2*m*n3 + &
&192.D0*a*b*c2*e*f*g2*h2*i*j*k2*m*n3 + &
&192.D0*a2*c*d*e*f*g2*h2*i*j*k2*m*n3 + &
&48.D0*a2*c2*f2*g2*h2*i*j*k2*m*n3 + &
&64.D0*a*b*c2*e2*g*h3*i*j*k2*m*n3 + &
&64.D0*a2*c*d*e2*g*h3*i*j*k2*m*n3 + &
&64.D0*a2*c2*e*f*g*h3*i*j*k2*m*n3 + &
&8.D0*a2*c2*e2*h4*i*j*k2*m*n3 + &
&8.D0*b2*c*d*e2*g4*j2*k2*m*n3 + &
&8.D0*a*b*d2*e2*g4*j2*k2*m*n3 + &
&8.D0*b2*c2*e*f*g4*j2*k2*m*n3 + &
&32.D0*a*b*c*d*e*f*g4*j2*k2*m*n3 + &
&8.D0*a2*d2*e*f*g4*j2*k2*m*n3 + &
&8.D0*a*b*c2*f2*g4*j2*k2*m*n3 + &
&8.D0*a2*c*d*f2*g4*j2*k2*m*n3 + &
&16.D0*b2*c2*e2*g3*h*j2*k2*m*n3 + &
&64.D0*a*b*c*d*e2*g3*h*j2*k2*m*n3 + &
&16.D0*a2*d2*e2*g3*h*j2*k2*m*n3 + &
&64.D0*a*b*c2*e*f*g3*h*j2*k2*m*n3 + &
&64.D0*a2*c*d*e*f*g3*h*j2*k2*m*n3 + &
&16.D0*a2*c2*f2*g3*h*j2*k2*m*n3 + &
&48.D0*a*b*c2*e2*g2*h2*j2*k2*m*n3 + &
&48.D0*a2*c*d*e2*g2*h2*j2*k2*m*n3 + &
&48.D0*a2*c2*e*f*g2*h2*j2*k2*m*n3 + &
&16.D0*a2*c2*e2*g*h3*j2*k2*m*n3 + &
&8.D0*b2*d2*e2*g4*i2*k*l*m*n3 + &
&32.D0*b2*c*d*e*f*g4*i2*k*l*m*n3 + &
&32.D0*a*b*d2*e*f*g4*i2*k*l*m*n3 + &
&8.D0*b2*c2*f2*g4*i2*k*l*m*n3 + &
&32.D0*a*b*c*d*f2*g4*i2*k*l*m*n3 + &
&8.D0*a2*d2*f2*g4*i2*k*l*m*n3 + &
&64.D0*b2*c*d*e2*g3*h*i2*k*l*m*n3 + &
&64.D0*a*b*d2*e2*g3*h*i2*k*l*m*n3 + &
&64.D0*b2*c2*e*f*g3*h*i2*k*l*m*n3 + &
&256.D0*a*b*c*d*e*f*g3*h*i2*k*l*m*n3 + &
&64.D0*a2*d2*e*f*g3*h*i2*k*l*m*n3 + &
&64.D0*a*b*c2*f2*g3*h*i2*k*l*m*n3 + &
&64.D0*a2*c*d*f2*g3*h*i2*k*l*m*n3 + &
&48.D0*b2*c2*e2*g2*h2*i2*k*l*m*n3 + &
&192.D0*a*b*c*d*e2*g2*h2*i2*k*l*m*n3 + &
&48.D0*a2*d2*e2*g2*h2*i2*k*l*m*n3 + &
&192.D0*a*b*c2*e*f*g2*h2*i2*k*l*m*n3 + &
&192.D0*a2*c*d*e*f*g2*h2*i2*k*l*m*n3 + &
&48.D0*a2*c2*f2*g2*h2*i2*k*l*m*n3 + &
&64.D0*a*b*c2*e2*g*h3*i2*k*l*m*n3 + &
&64.D0*a2*c*d*e2*g*h3*i2*k*l*m*n3 + &
&64.D0*a2*c2*e*f*g*h3*i2*k*l*m*n3 + &
&8.D0*a2*c2*e2*h4*i2*k*l*m*n3 + &
&32.D0*b2*c*d*e2*g4*i*j*k*l*m*n3 + &
&32.D0*a*b*d2*e2*g4*i*j*k*l*m*n3 + &
&32.D0*b2*c2*e*f*g4*i*j*k*l*m*n3 + &
&128.D0*a*b*c*d*e*f*g4*i*j*k*l*m*n3 + &
&32.D0*a2*d2*e*f*g4*i*j*k*l*m*n3 + &
&32.D0*a*b*c2*f2*g4*i*j*k*l*m*n3 + &
&32.D0*a2*c*d*f2*g4*i*j*k*l*m*n3 + &
&64.D0*b2*c2*e2*g3*h*i*j*k*l*m*n3 + &
&256.D0*a*b*c*d*e2*g3*h*i*j*k*l*m*n3 + &
&64.D0*a2*d2*e2*g3*h*i*j*k*l*m*n3 + &
&256.D0*a*b*c2*e*f*g3*h*i*j*k*l*m*n3 + &
&256.D0*a2*c*d*e*f*g3*h*i*j*k*l*m*n3 + &
&64.D0*a2*c2*f2*g3*h*i*j*k*l*m*n3 + &
&192.D0*a*b*c2*e2*g2*h2*i*j*k*l*m*n3 + &
&192.D0*a2*c*d*e2*g2*h2*i*j*k*l*m*n3 + &
&192.D0*a2*c2*e*f*g2*h2*i*j*k*l*m*n3 + &
&64.D0*a2*c2*e2*g*h3*i*j*k*l*m*n3 + &
&8.D0*b2*c2*e2*g4*j2*k*l*m*n3 + &
&32.D0*a*b*c*d*e2*g4*j2*k*l*m*n3 + &
&8.D0*a2*d2*e2*g4*j2*k*l*m*n3 + &
&32.D0*a*b*c2*e*f*g4*j2*k*l*m*n3 + &
&32.D0*a2*c*d*e*f*g4*j2*k*l*m*n3 + &
&8.D0*a2*c2*f2*g4*j2*k*l*m*n3 + &
&64.D0*a*b*c2*e2*g3*h*j2*k*l*m*n3 + &
&64.D0*a2*c*d*e2*g3*h*j2*k*l*m*n3 + &
&64.D0*a2*c2*e*f*g3*h*j2*k*l*m*n3 + &
&48.D0*a2*c2*e2*g2*h2*j2*k*l*m*n3 + &
&8.D0*b2*c*d*e2*g4*i2*l2*m*n3 + &
&8.D0*a*b*d2*e2*g4*i2*l2*m*n3 + &
&8.D0*b2*c2*e*f*g4*i2*l2*m*n3 + &
&32.D0*a*b*c*d*e*f*g4*i2*l2*m*n3 + &
&8.D0*a2*d2*e*f*g4*i2*l2*m*n3 + &
&8.D0*a*b*c2*f2*g4*i2*l2*m*n3 + &
&8.D0*a2*c*d*f2*g4*i2*l2*m*n3 + &
&16.D0*b2*c2*e2*g3*h*i2*l2*m*n3 + &
&64.D0*a*b*c*d*e2*g3*h*i2*l2*m*n3 + &
&16.D0*a2*d2*e2*g3*h*i2*l2*m*n3 + &
&64.D0*a*b*c2*e*f*g3*h*i2*l2*m*n3 + &
&64.D0*a2*c*d*e*f*g3*h*i2*l2*m*n3 + &
&16.D0*a2*c2*f2*g3*h*i2*l2*m*n3 + &
&48.D0*a*b*c2*e2*g2*h2*i2*l2*m*n3 + &
&48.D0*a2*c*d*e2*g2*h2*i2*l2*m*n3 + &
&48.D0*a2*c2*e*f*g2*h2*i2*l2*m*n3 + &
&16.D0*a2*c2*e2*g*h3*i2*l2*m*n3 + &
&8.D0*b2*c2*e2*g4*i*j*l2*m*n3 + &
&32.D0*a*b*c*d*e2*g4*i*j*l2*m*n3 + &
&8.D0*a2*d2*e2*g4*i*j*l2*m*n3 + &
&32.D0*a*b*c2*e*f*g4*i*j*l2*m*n3 + &
&32.D0*a2*c*d*e*f*g4*i*j*l2*m*n3 + &
&8.D0*a2*c2*f2*g4*i*j*l2*m*n3 + &
&64.D0*a*b*c2*e2*g3*h*i*j*l2*m*n3 + &
&64.D0*a2*c*d*e2*g3*h*i*j*l2*m*n3 + &
&64.D0*a2*c2*e*f*g3*h*i*j*l2*m*n3 + &
&48.D0*a2*c2*e2*g2*h2*i*j*l2*m*n3 + &
&8.D0*a*b*c2*e2*g4*j2*l2*m*n3 + &
&8.D0*a2*c*d*e2*g4*j2*l2*m*n3 + &
&8.D0*a2*c2*e*f*g4*j2*l2*m*n3 + &
&16.D0*a2*c2*e2*g3*h*j2*l2*m*n3 + &
&b2*d2*e2*g4*i2*k2*n4 + &
&4.D0*b2*c*d*e*f*g4*i2*k2*n4 + &
&4.D0*a*b*d2*e*f*g4*i2*k2*n4 + &
&b2*c2*f2*g4*i2*k2*n4 + &
&4.D0*a*b*c*d*f2*g4*i2*k2*n4 + &
&a2*d2*f2*g4*i2*k2*n4 + &
&8.D0*b2*c*d*e2*g3*h*i2*k2*n4 + &
&8.D0*a*b*d2*e2*g3*h*i2*k2*n4 + &
&8.D0*b2*c2*e*f*g3*h*i2*k2*n4 + &
&32.D0*a*b*c*d*e*f*g3*h*i2*k2*n4 + &
&8.D0*a2*d2*e*f*g3*h*i2*k2*n4 + &
&8.D0*a*b*c2*f2*g3*h*i2*k2*n4 + &
&8.D0*a2*c*d*f2*g3*h*i2*k2*n4 + &
&6.D0*b2*c2*e2*g2*h2*i2*k2*n4 + &
&24.D0*a*b*c*d*e2*g2*h2*i2*k2*n4 + &
&6.D0*a2*d2*e2*g2*h2*i2*k2*n4 + &
&24.D0*a*b*c2*e*f*g2*h2*i2*k2*n4 + &
&24.D0*a2*c*d*e*f*g2*h2*i2*k2*n4 + &
&6.D0*a2*c2*f2*g2*h2*i2*k2*n4 + &
&8.D0*a*b*c2*e2*g*h3*i2*k2*n4 + &
&8.D0*a2*c*d*e2*g*h3*i2*k2*n4 + &
&8.D0*a2*c2*e*f*g*h3*i2*k2*n4 + &
&a2*c2*e2*h4*i2*k2*n4 + &
&4.D0*b2*c*d*e2*g4*i*j*k2*n4 + &
&4.D0*a*b*d2*e2*g4*i*j*k2*n4 + &
&4.D0*b2*c2*e*f*g4*i*j*k2*n4 + &
&16.D0*a*b*c*d*e*f*g4*i*j*k2*n4 + &
&4.D0*a2*d2*e*f*g4*i*j*k2*n4 + &
&4.D0*a*b*c2*f2*g4*i*j*k2*n4 + &
&4.D0*a2*c*d*f2*g4*i*j*k2*n4 + &
&8.D0*b2*c2*e2*g3*h*i*j*k2*n4 + &
&32.D0*a*b*c*d*e2*g3*h*i*j*k2*n4 + &
&8.D0*a2*d2*e2*g3*h*i*j*k2*n4 + &
&32.D0*a*b*c2*e*f*g3*h*i*j*k2*n4 + &
&32.D0*a2*c*d*e*f*g3*h*i*j*k2*n4 + &
&8.D0*a2*c2*f2*g3*h*i*j*k2*n4 + &
&24.D0*a*b*c2*e2*g2*h2*i*j*k2*n4 + &
&24.D0*a2*c*d*e2*g2*h2*i*j*k2*n4 + &
&24.D0*a2*c2*e*f*g2*h2*i*j*k2*n4 + &
&8.D0*a2*c2*e2*g*h3*i*j*k2*n4 + &
&b2*c2*e2*g4*j2*k2*n4 + &
&4.D0*a*b*c*d*e2*g4*j2*k2*n4 + &
&a2*d2*e2*g4*j2*k2*n4 + &
&4.D0*a*b*c2*e*f*g4*j2*k2*n4 + &
&4.D0*a2*c*d*e*f*g4*j2*k2*n4 + &
&a2*c2*f2*g4*j2*k2*n4 + &
&8.D0*a*b*c2*e2*g3*h*j2*k2*n4 + &
&8.D0*a2*c*d*e2*g3*h*j2*k2*n4 + &
&8.D0*a2*c2*e*f*g3*h*j2*k2*n4 + &
&6.D0*a2*c2*e2*g2*h2*j2*k2*n4 + &
&4.D0*b2*c*d*e2*g4*i2*k*l*n4 + &
&4.D0*a*b*d2*e2*g4*i2*k*l*n4 + &
&4.D0*b2*c2*e*f*g4*i2*k*l*n4 + &
&16.D0*a*b*c*d*e*f*g4*i2*k*l*n4 + &
&4.D0*a2*d2*e*f*g4*i2*k*l*n4 + &
&4.D0*a*b*c2*f2*g4*i2*k*l*n4 + &
&4.D0*a2*c*d*f2*g4*i2*k*l*n4 + &
&8.D0*b2*c2*e2*g3*h*i2*k*l*n4 + &
&32.D0*a*b*c*d*e2*g3*h*i2*k*l*n4 + &
&8.D0*a2*d2*e2*g3*h*i2*k*l*n4 + &
&32.D0*a*b*c2*e*f*g3*h*i2*k*l*n4 + &
&32.D0*a2*c*d*e*f*g3*h*i2*k*l*n4 + &
&8.D0*a2*c2*f2*g3*h*i2*k*l*n4 + &
&24.D0*a*b*c2*e2*g2*h2*i2*k*l*n4 + &
&24.D0*a2*c*d*e2*g2*h2*i2*k*l*n4 + &
&24.D0*a2*c2*e*f*g2*h2*i2*k*l*n4 + &
&8.D0*a2*c2*e2*g*h3*i2*k*l*n4 + &
&4.D0*b2*c2*e2*g4*i*j*k*l*n4 + &
&16.D0*a*b*c*d*e2*g4*i*j*k*l*n4 + &
&4.D0*a2*d2*e2*g4*i*j*k*l*n4 + &
&16.D0*a*b*c2*e*f*g4*i*j*k*l*n4 + &
&16.D0*a2*c*d*e*f*g4*i*j*k*l*n4 + &
&4.D0*a2*c2*f2*g4*i*j*k*l*n4 + &
&32.D0*a*b*c2*e2*g3*h*i*j*k*l*n4 + &
&32.D0*a2*c*d*e2*g3*h*i*j*k*l*n4 + &
&32.D0*a2*c2*e*f*g3*h*i*j*k*l*n4 + &
&24.D0*a2*c2*e2*g2*h2*i*j*k*l*n4 + &
&4.D0*a*b*c2*e2*g4*j2*k*l*n4 + &
&4.D0*a2*c*d*e2*g4*j2*k*l*n4 + &
&4.D0*a2*c2*e*f*g4*j2*k*l*n4 + &
&8.D0*a2*c2*e2*g3*h*j2*k*l*n4 + &
&b2*c2*e2*g4*i2*l2*n4 + &
&4.D0*a*b*c*d*e2*g4*i2*l2*n4 + &
&a2*d2*e2*g4*i2*l2*n4 + &
&4.D0*a*b*c2*e*f*g4*i2*l2*n4 + &
&4.D0*a2*c*d*e*f*g4*i2*l2*n4 + &
&a2*c2*f2*g4*i2*l2*n4 + &
&8.D0*a*b*c2*e2*g3*h*i2*l2*n4 + &
&8.D0*a2*c*d*e2*g3*h*i2*l2*n4 + &
&8.D0*a2*c2*e*f*g3*h*i2*l2*n4 + &
&6.D0*a2*c2*e2*g2*h2*i2*l2*n4 + &
&4.D0*a*b*c2*e2*g4*i*j*l2*n4 + &
&4.D0*a2*c*d*e2*g4*i*j*l2*n4 + &
&4.D0*a2*c2*e*f*g4*i*j*l2*n4 + &
&8.D0*a2*c2*e2*g3*h*i*j*l2*n4 + &
&a2*c2*e2*g4*j2*l2*n4

IONIZ_PROBA(9)=4.D0*b2*d2*f2*g*h3*i2*k2*m4 + &
&2.D0*b2*d2*e*f*h4*i2*k2*m4 + &
&2.D0*b2*c*d*f2*h4*i2*k2*m4 + &
&2.D0*a*b*d2*f2*h4*i2*k2*m4 + &
&12.D0*b2*d2*f2*g2*h2*i*j*k2*m4 + &
&16.D0*b2*d2*e*f*g*h3*i*j*k2*m4 + &
&16.D0*b2*c*d*f2*g*h3*i*j*k2*m4 + &
&16.D0*a*b*d2*f2*g*h3*i*j*k2*m4 + &
&2.D0*b2*d2*e2*h4*i*j*k2*m4 + &
&8.D0*b2*c*d*e*f*h4*i*j*k2*m4 + &
&8.D0*a*b*d2*e*f*h4*i*j*k2*m4 + &
&2.D0*b2*c2*f2*h4*i*j*k2*m4 + &
&8.D0*a*b*c*d*f2*h4*i*j*k2*m4 + &
&2.D0*a2*d2*f2*h4*i*j*k2*m4 + &
&4.D0*b2*d2*f2*g3*h*j2*k2*m4 + &
&12.D0*b2*d2*e*f*g2*h2*j2*k2*m4 + &
&12.D0*b2*c*d*f2*g2*h2*j2*k2*m4 + &
&12.D0*a*b*d2*f2*g2*h2*j2*k2*m4 + &
&4.D0*b2*d2*e2*g*h3*j2*k2*m4 + &
&16.D0*b2*c*d*e*f*g*h3*j2*k2*m4 + &
&16.D0*a*b*d2*e*f*g*h3*j2*k2*m4 + &
&4.D0*b2*c2*f2*g*h3*j2*k2*m4 + &
&16.D0*a*b*c*d*f2*g*h3*j2*k2*m4 + &
&4.D0*a2*d2*f2*g*h3*j2*k2*m4 + &
&2.D0*b2*c*d*e2*h4*j2*k2*m4 + &
&2.D0*a*b*d2*e2*h4*j2*k2*m4 + &
&2.D0*b2*c2*e*f*h4*j2*k2*m4 + &
&8.D0*a*b*c*d*e*f*h4*j2*k2*m4 + &
&2.D0*a2*d2*e*f*h4*j2*k2*m4 + &
&2.D0*a*b*c2*f2*h4*j2*k2*m4 + &
&2.D0*a2*c*d*f2*h4*j2*k2*m4 + &
&12.D0*b2*d2*f2*g2*h2*i2*k*l*m4 + &
&16.D0*b2*d2*e*f*g*h3*i2*k*l*m4 + &
&16.D0*b2*c*d*f2*g*h3*i2*k*l*m4 + &
&16.D0*a*b*d2*f2*g*h3*i2*k*l*m4 + &
&2.D0*b2*d2*e2*h4*i2*k*l*m4 + &
&8.D0*b2*c*d*e*f*h4*i2*k*l*m4 + &
&8.D0*a*b*d2*e*f*h4*i2*k*l*m4 + &
&2.D0*b2*c2*f2*h4*i2*k*l*m4 + &
&8.D0*a*b*c*d*f2*h4*i2*k*l*m4 + &
&2.D0*a2*d2*f2*h4*i2*k*l*m4 + &
&16.D0*b2*d2*f2*g3*h*i*j*k*l*m4 + &
&48.D0*b2*d2*e*f*g2*h2*i*j*k*l*m4 + &
&48.D0*b2*c*d*f2*g2*h2*i*j*k*l*m4 + &
&48.D0*a*b*d2*f2*g2*h2*i*j*k*l*m4 + &
&16.D0*b2*d2*e2*g*h3*i*j*k*l*m4 + &
&64.D0*b2*c*d*e*f*g*h3*i*j*k*l*m4 + &
&64.D0*a*b*d2*e*f*g*h3*i*j*k*l*m4 + &
&16.D0*b2*c2*f2*g*h3*i*j*k*l*m4 + &
&64.D0*a*b*c*d*f2*g*h3*i*j*k*l*m4 + &
&16.D0*a2*d2*f2*g*h3*i*j*k*l*m4 + &
&8.D0*b2*c*d*e2*h4*i*j*k*l*m4 + &
&8.D0*a*b*d2*e2*h4*i*j*k*l*m4 + &
&8.D0*b2*c2*e*f*h4*i*j*k*l*m4 + &
&32.D0*a*b*c*d*e*f*h4*i*j*k*l*m4 + &
&8.D0*a2*d2*e*f*h4*i*j*k*l*m4 + &
&8.D0*a*b*c2*f2*h4*i*j*k*l*m4 + &
&8.D0*a2*c*d*f2*h4*i*j*k*l*m4 + &
&2.D0*b2*d2*f2*g4*j2*k*l*m4 + &
&16.D0*b2*d2*e*f*g3*h*j2*k*l*m4 + &
&16.D0*b2*c*d*f2*g3*h*j2*k*l*m4 + &
&16.D0*a*b*d2*f2*g3*h*j2*k*l*m4 + &
&12.D0*b2*d2*e2*g2*h2*j2*k*l*m4 + &
&48.D0*b2*c*d*e*f*g2*h2*j2*k*l*m4 + &
&48.D0*a*b*d2*e*f*g2*h2*j2*k*l*m4 + &
&12.D0*b2*c2*f2*g2*h2*j2*k*l*m4 + &
&48.D0*a*b*c*d*f2*g2*h2*j2*k*l*m4 + &
&12.D0*a2*d2*f2*g2*h2*j2*k*l*m4 + &
&16.D0*b2*c*d*e2*g*h3*j2*k*l*m4 + &
&16.D0*a*b*d2*e2*g*h3*j2*k*l*m4 + &
&16.D0*b2*c2*e*f*g*h3*j2*k*l*m4 + &
&64.D0*a*b*c*d*e*f*g*h3*j2*k*l*m4 + &
&16.D0*a2*d2*e*f*g*h3*j2*k*l*m4 + &
&16.D0*a*b*c2*f2*g*h3*j2*k*l*m4 + &
&16.D0*a2*c*d*f2*g*h3*j2*k*l*m4 + &
&2.D0*b2*c2*e2*h4*j2*k*l*m4 + &
&8.D0*a*b*c*d*e2*h4*j2*k*l*m4 + &
&2.D0*a2*d2*e2*h4*j2*k*l*m4 + &
&8.D0*a*b*c2*e*f*h4*j2*k*l*m4 + &
&8.D0*a2*c*d*e*f*h4*j2*k*l*m4 + &
&2.D0*a2*c2*f2*h4*j2*k*l*m4 + &
&4.D0*b2*d2*f2*g3*h*i2*l2*m4 + &
&12.D0*b2*d2*e*f*g2*h2*i2*l2*m4 + &
&12.D0*b2*c*d*f2*g2*h2*i2*l2*m4 + &
&12.D0*a*b*d2*f2*g2*h2*i2*l2*m4 + &
&4.D0*b2*d2*e2*g*h3*i2*l2*m4 + &
&16.D0*b2*c*d*e*f*g*h3*i2*l2*m4 + &
&16.D0*a*b*d2*e*f*g*h3*i2*l2*m4 + &
&4.D0*b2*c2*f2*g*h3*i2*l2*m4 + &
&16.D0*a*b*c*d*f2*g*h3*i2*l2*m4 + &
&4.D0*a2*d2*f2*g*h3*i2*l2*m4 + &
&2.D0*b2*c*d*e2*h4*i2*l2*m4 + &
&2.D0*a*b*d2*e2*h4*i2*l2*m4 + &
&2.D0*b2*c2*e*f*h4*i2*l2*m4 + &
&8.D0*a*b*c*d*e*f*h4*i2*l2*m4 + &
&2.D0*a2*d2*e*f*h4*i2*l2*m4 + &
&2.D0*a*b*c2*f2*h4*i2*l2*m4 + &
&2.D0*a2*c*d*f2*h4*i2*l2*m4 + &
&2.D0*b2*d2*f2*g4*i*j*l2*m4 + &
&16.D0*b2*d2*e*f*g3*h*i*j*l2*m4 + &
&16.D0*b2*c*d*f2*g3*h*i*j*l2*m4 + &
&16.D0*a*b*d2*f2*g3*h*i*j*l2*m4 + &
&12.D0*b2*d2*e2*g2*h2*i*j*l2*m4 + &
&48.D0*b2*c*d*e*f*g2*h2*i*j*l2*m4 + &
&48.D0*a*b*d2*e*f*g2*h2*i*j*l2*m4 + &
&12.D0*b2*c2*f2*g2*h2*i*j*l2*m4 + &
&48.D0*a*b*c*d*f2*g2*h2*i*j*l2*m4 + &
&12.D0*a2*d2*f2*g2*h2*i*j*l2*m4 + &
&16.D0*b2*c*d*e2*g*h3*i*j*l2*m4 + &
&16.D0*a*b*d2*e2*g*h3*i*j*l2*m4 + &
&16.D0*b2*c2*e*f*g*h3*i*j*l2*m4 + &
&64.D0*a*b*c*d*e*f*g*h3*i*j*l2*m4 + &
&16.D0*a2*d2*e*f*g*h3*i*j*l2*m4 + &
&16.D0*a*b*c2*f2*g*h3*i*j*l2*m4 + &
&16.D0*a2*c*d*f2*g*h3*i*j*l2*m4 + &
&2.D0*b2*c2*e2*h4*i*j*l2*m4 + &
&8.D0*a*b*c*d*e2*h4*i*j*l2*m4 + &
&2.D0*a2*d2*e2*h4*i*j*l2*m4 + &
&8.D0*a*b*c2*e*f*h4*i*j*l2*m4 + &
&8.D0*a2*c*d*e*f*h4*i*j*l2*m4 + &
&2.D0*a2*c2*f2*h4*i*j*l2*m4 + &
&2.D0*b2*d2*e*f*g4*j2*l2*m4 + &
&2.D0*b2*c*d*f2*g4*j2*l2*m4 + &
&2.D0*a*b*d2*f2*g4*j2*l2*m4 + &
&4.D0*b2*d2*e2*g3*h*j2*l2*m4 + &
&16.D0*b2*c*d*e*f*g3*h*j2*l2*m4 + &
&16.D0*a*b*d2*e*f*g3*h*j2*l2*m4 + &
&4.D0*b2*c2*f2*g3*h*j2*l2*m4 + &
&16.D0*a*b*c*d*f2*g3*h*j2*l2*m4 + &
&4.D0*a2*d2*f2*g3*h*j2*l2*m4 + &
&12.D0*b2*c*d*e2*g2*h2*j2*l2*m4 + &
&12.D0*a*b*d2*e2*g2*h2*j2*l2*m4 + &
&12.D0*b2*c2*e*f*g2*h2*j2*l2*m4 + &
&48.D0*a*b*c*d*e*f*g2*h2*j2*l2*m4 + &
&12.D0*a2*d2*e*f*g2*h2*j2*l2*m4 + &
&12.D0*a*b*c2*f2*g2*h2*j2*l2*m4 + &
&12.D0*a2*c*d*f2*g2*h2*j2*l2*m4 + &
&4.D0*b2*c2*e2*g*h3*j2*l2*m4 + &
&16.D0*a*b*c*d*e2*g*h3*j2*l2*m4 + &
&4.D0*a2*d2*e2*g*h3*j2*l2*m4 + &
&16.D0*a*b*c2*e*f*g*h3*j2*l2*m4 + &
&16.D0*a2*c*d*e*f*g*h3*j2*l2*m4 + &
&4.D0*a2*c2*f2*g*h3*j2*l2*m4 + &
&2.D0*a*b*c2*e2*h4*j2*l2*m4 + &
&2.D0*a2*c*d*e2*h4*j2*l2*m4 + &
&2.D0*a2*c2*e*f*h4*j2*l2*m4 + &
&24.D0*b2*d2*f2*g2*h2*i2*k2*m3*n + &
&32.D0*b2*d2*e*f*g*h3*i2*k2*m3*n + &
&32.D0*b2*c*d*f2*g*h3*i2*k2*m3*n + &
&32.D0*a*b*d2*f2*g*h3*i2*k2*m3*n + &
&4.D0*b2*d2*e2*h4*i2*k2*m3*n + &
&16.D0*b2*c*d*e*f*h4*i2*k2*m3*n + &
&16.D0*a*b*d2*e*f*h4*i2*k2*m3*n + &
&4.D0*b2*c2*f2*h4*i2*k2*m3*n + &
&16.D0*a*b*c*d*f2*h4*i2*k2*m3*n + &
&4.D0*a2*d2*f2*h4*i2*k2*m3*n + &
&32.D0*b2*d2*f2*g3*h*i*j*k2*m3*n + &
&96.D0*b2*d2*e*f*g2*h2*i*j*k2*m3*n + &
&96.D0*b2*c*d*f2*g2*h2*i*j*k2*m3*n + &
&96.D0*a*b*d2*f2*g2*h2*i*j*k2*m3*n + &
&32.D0*b2*d2*e2*g*h3*i*j*k2*m3*n + &
&128.D0*b2*c*d*e*f*g*h3*i*j*k2*m3*n + &
&128.D0*a*b*d2*e*f*g*h3*i*j*k2*m3*n + &
&32.D0*b2*c2*f2*g*h3*i*j*k2*m3*n + &
&128.D0*a*b*c*d*f2*g*h3*i*j*k2*m3*n + &
&32.D0*a2*d2*f2*g*h3*i*j*k2*m3*n + &
&16.D0*b2*c*d*e2*h4*i*j*k2*m3*n + &
&16.D0*a*b*d2*e2*h4*i*j*k2*m3*n + &
&16.D0*b2*c2*e*f*h4*i*j*k2*m3*n + &
&64.D0*a*b*c*d*e*f*h4*i*j*k2*m3*n + &
&16.D0*a2*d2*e*f*h4*i*j*k2*m3*n + &
&16.D0*a*b*c2*f2*h4*i*j*k2*m3*n + &
&16.D0*a2*c*d*f2*h4*i*j*k2*m3*n + &
&4.D0*b2*d2*f2*g4*j2*k2*m3*n + &
&32.D0*b2*d2*e*f*g3*h*j2*k2*m3*n + &
&32.D0*b2*c*d*f2*g3*h*j2*k2*m3*n + &
&32.D0*a*b*d2*f2*g3*h*j2*k2*m3*n + &
&24.D0*b2*d2*e2*g2*h2*j2*k2*m3*n + &
&96.D0*b2*c*d*e*f*g2*h2*j2*k2*m3*n + &
&96.D0*a*b*d2*e*f*g2*h2*j2*k2*m3*n + &
&24.D0*b2*c2*f2*g2*h2*j2*k2*m3*n + &
&96.D0*a*b*c*d*f2*g2*h2*j2*k2*m3*n + &
&24.D0*a2*d2*f2*g2*h2*j2*k2*m3*n + &
&32.D0*b2*c*d*e2*g*h3*j2*k2*m3*n + &
&32.D0*a*b*d2*e2*g*h3*j2*k2*m3*n + &
&32.D0*b2*c2*e*f*g*h3*j2*k2*m3*n + &
&128.D0*a*b*c*d*e*f*g*h3*j2*k2*m3*n + &
&32.D0*a2*d2*e*f*g*h3*j2*k2*m3*n + &
&32.D0*a*b*c2*f2*g*h3*j2*k2*m3*n + &
&32.D0*a2*c*d*f2*g*h3*j2*k2*m3*n + &
&4.D0*b2*c2*e2*h4*j2*k2*m3*n + &
&16.D0*a*b*c*d*e2*h4*j2*k2*m3*n + &
&4.D0*a2*d2*e2*h4*j2*k2*m3*n + &
&16.D0*a*b*c2*e*f*h4*j2*k2*m3*n + &
&16.D0*a2*c*d*e*f*h4*j2*k2*m3*n + &
&4.D0*a2*c2*f2*h4*j2*k2*m3*n + &
&32.D0*b2*d2*f2*g3*h*i2*k*l*m3*n + &
&96.D0*b2*d2*e*f*g2*h2*i2*k*l*m3*n + &
&96.D0*b2*c*d*f2*g2*h2*i2*k*l*m3*n + &
&96.D0*a*b*d2*f2*g2*h2*i2*k*l*m3*n + &
&32.D0*b2*d2*e2*g*h3*i2*k*l*m3*n + &
&128.D0*b2*c*d*e*f*g*h3*i2*k*l*m3*n + &
&128.D0*a*b*d2*e*f*g*h3*i2*k*l*m3*n + &
&32.D0*b2*c2*f2*g*h3*i2*k*l*m3*n + &
&128.D0*a*b*c*d*f2*g*h3*i2*k*l*m3*n + &
&32.D0*a2*d2*f2*g*h3*i2*k*l*m3*n + &
&16.D0*b2*c*d*e2*h4*i2*k*l*m3*n + &
&16.D0*a*b*d2*e2*h4*i2*k*l*m3*n + &
&16.D0*b2*c2*e*f*h4*i2*k*l*m3*n + &
&64.D0*a*b*c*d*e*f*h4*i2*k*l*m3*n + &
&16.D0*a2*d2*e*f*h4*i2*k*l*m3*n + &
&16.D0*a*b*c2*f2*h4*i2*k*l*m3*n + &
&16.D0*a2*c*d*f2*h4*i2*k*l*m3*n + &
&16.D0*b2*d2*f2*g4*i*j*k*l*m3*n + &
&128.D0*b2*d2*e*f*g3*h*i*j*k*l*m3*n + &
&128.D0*b2*c*d*f2*g3*h*i*j*k*l*m3*n + &
&128.D0*a*b*d2*f2*g3*h*i*j*k*l*m3*n + &
&96.D0*b2*d2*e2*g2*h2*i*j*k*l*m3*n + &
&384.D0*b2*c*d*e*f*g2*h2*i*j*k*l*m3*n + &
&384.D0*a*b*d2*e*f*g2*h2*i*j*k*l*m3*n + &
&96.D0*b2*c2*f2*g2*h2*i*j*k*l*m3*n + &
&384.D0*a*b*c*d*f2*g2*h2*i*j*k*l*m3*n + &
&96.D0*a2*d2*f2*g2*h2*i*j*k*l*m3*n + &
&128.D0*b2*c*d*e2*g*h3*i*j*k*l*m3*n + &
&128.D0*a*b*d2*e2*g*h3*i*j*k*l*m3*n + &
&128.D0*b2*c2*e*f*g*h3*i*j*k*l*m3*n + &
&512.D0*a*b*c*d*e*f*g*h3*i*j*k*l*m3*n + &
&128.D0*a2*d2*e*f*g*h3*i*j*k*l*m3*n + &
&128.D0*a*b*c2*f2*g*h3*i*j*k*l*m3*n + &
&128.D0*a2*c*d*f2*g*h3*i*j*k*l*m3*n + &
&16.D0*b2*c2*e2*h4*i*j*k*l*m3*n + &
&64.D0*a*b*c*d*e2*h4*i*j*k*l*m3*n + &
&16.D0*a2*d2*e2*h4*i*j*k*l*m3*n + &
&64.D0*a*b*c2*e*f*h4*i*j*k*l*m3*n + &
&64.D0*a2*c*d*e*f*h4*i*j*k*l*m3*n + &
&16.D0*a2*c2*f2*h4*i*j*k*l*m3*n + &
&16.D0*b2*d2*e*f*g4*j2*k*l*m3*n + &
&16.D0*b2*c*d*f2*g4*j2*k*l*m3*n + &
&16.D0*a*b*d2*f2*g4*j2*k*l*m3*n + &
&32.D0*b2*d2*e2*g3*h*j2*k*l*m3*n + &
&128.D0*b2*c*d*e*f*g3*h*j2*k*l*m3*n + &
&128.D0*a*b*d2*e*f*g3*h*j2*k*l*m3*n + &
&32.D0*b2*c2*f2*g3*h*j2*k*l*m3*n + &
&128.D0*a*b*c*d*f2*g3*h*j2*k*l*m3*n + &
&32.D0*a2*d2*f2*g3*h*j2*k*l*m3*n + &
&96.D0*b2*c*d*e2*g2*h2*j2*k*l*m3*n + &
&96.D0*a*b*d2*e2*g2*h2*j2*k*l*m3*n + &
&96.D0*b2*c2*e*f*g2*h2*j2*k*l*m3*n + &
&384.D0*a*b*c*d*e*f*g2*h2*j2*k*l*m3*n + &
&96.D0*a2*d2*e*f*g2*h2*j2*k*l*m3*n + &
&96.D0*a*b*c2*f2*g2*h2*j2*k*l*m3*n + &
&96.D0*a2*c*d*f2*g2*h2*j2*k*l*m3*n + &
&32.D0*b2*c2*e2*g*h3*j2*k*l*m3*n + &
&128.D0*a*b*c*d*e2*g*h3*j2*k*l*m3*n + &
&32.D0*a2*d2*e2*g*h3*j2*k*l*m3*n + &
&128.D0*a*b*c2*e*f*g*h3*j2*k*l*m3*n + &
&128.D0*a2*c*d*e*f*g*h3*j2*k*l*m3*n + &
&32.D0*a2*c2*f2*g*h3*j2*k*l*m3*n + &
&16.D0*a*b*c2*e2*h4*j2*k*l*m3*n + &
&16.D0*a2*c*d*e2*h4*j2*k*l*m3*n + &
&16.D0*a2*c2*e*f*h4*j2*k*l*m3*n + &
&4.D0*b2*d2*f2*g4*i2*l2*m3*n + &
&32.D0*b2*d2*e*f*g3*h*i2*l2*m3*n + &
&32.D0*b2*c*d*f2*g3*h*i2*l2*m3*n + &
&32.D0*a*b*d2*f2*g3*h*i2*l2*m3*n + &
&24.D0*b2*d2*e2*g2*h2*i2*l2*m3*n + &
&96.D0*b2*c*d*e*f*g2*h2*i2*l2*m3*n + &
&96.D0*a*b*d2*e*f*g2*h2*i2*l2*m3*n + &
&24.D0*b2*c2*f2*g2*h2*i2*l2*m3*n + &
&96.D0*a*b*c*d*f2*g2*h2*i2*l2*m3*n + &
&24.D0*a2*d2*f2*g2*h2*i2*l2*m3*n + &
&32.D0*b2*c*d*e2*g*h3*i2*l2*m3*n + &
&32.D0*a*b*d2*e2*g*h3*i2*l2*m3*n + &
&32.D0*b2*c2*e*f*g*h3*i2*l2*m3*n + &
&128.D0*a*b*c*d*e*f*g*h3*i2*l2*m3*n + &
&32.D0*a2*d2*e*f*g*h3*i2*l2*m3*n + &
&32.D0*a*b*c2*f2*g*h3*i2*l2*m3*n + &
&32.D0*a2*c*d*f2*g*h3*i2*l2*m3*n + &
&4.D0*b2*c2*e2*h4*i2*l2*m3*n + &
&16.D0*a*b*c*d*e2*h4*i2*l2*m3*n + &
&4.D0*a2*d2*e2*h4*i2*l2*m3*n + &
&16.D0*a*b*c2*e*f*h4*i2*l2*m3*n + &
&16.D0*a2*c*d*e*f*h4*i2*l2*m3*n + &
&4.D0*a2*c2*f2*h4*i2*l2*m3*n + &
&16.D0*b2*d2*e*f*g4*i*j*l2*m3*n + &
&16.D0*b2*c*d*f2*g4*i*j*l2*m3*n + &
&16.D0*a*b*d2*f2*g4*i*j*l2*m3*n + &
&32.D0*b2*d2*e2*g3*h*i*j*l2*m3*n + &
&128.D0*b2*c*d*e*f*g3*h*i*j*l2*m3*n + &
&128.D0*a*b*d2*e*f*g3*h*i*j*l2*m3*n + &
&32.D0*b2*c2*f2*g3*h*i*j*l2*m3*n + &
&128.D0*a*b*c*d*f2*g3*h*i*j*l2*m3*n + &
&32.D0*a2*d2*f2*g3*h*i*j*l2*m3*n + &
&96.D0*b2*c*d*e2*g2*h2*i*j*l2*m3*n + &
&96.D0*a*b*d2*e2*g2*h2*i*j*l2*m3*n + &
&96.D0*b2*c2*e*f*g2*h2*i*j*l2*m3*n + &
&384.D0*a*b*c*d*e*f*g2*h2*i*j*l2*m3*n + &
&96.D0*a2*d2*e*f*g2*h2*i*j*l2*m3*n + &
&96.D0*a*b*c2*f2*g2*h2*i*j*l2*m3*n + &
&96.D0*a2*c*d*f2*g2*h2*i*j*l2*m3*n + &
&32.D0*b2*c2*e2*g*h3*i*j*l2*m3*n + &
&128.D0*a*b*c*d*e2*g*h3*i*j*l2*m3*n + &
&32.D0*a2*d2*e2*g*h3*i*j*l2*m3*n + &
&128.D0*a*b*c2*e*f*g*h3*i*j*l2*m3*n + &
&128.D0*a2*c*d*e*f*g*h3*i*j*l2*m3*n + &
&32.D0*a2*c2*f2*g*h3*i*j*l2*m3*n + &
&16.D0*a*b*c2*e2*h4*i*j*l2*m3*n + &
&16.D0*a2*c*d*e2*h4*i*j*l2*m3*n + &
&16.D0*a2*c2*e*f*h4*i*j*l2*m3*n + &
&4.D0*b2*d2*e2*g4*j2*l2*m3*n + &
&16.D0*b2*c*d*e*f*g4*j2*l2*m3*n + &
&16.D0*a*b*d2*e*f*g4*j2*l2*m3*n + &
&4.D0*b2*c2*f2*g4*j2*l2*m3*n + &
&16.D0*a*b*c*d*f2*g4*j2*l2*m3*n + &
&4.D0*a2*d2*f2*g4*j2*l2*m3*n + &
&32.D0*b2*c*d*e2*g3*h*j2*l2*m3*n + &
&32.D0*a*b*d2*e2*g3*h*j2*l2*m3*n + &
&32.D0*b2*c2*e*f*g3*h*j2*l2*m3*n + &
&128.D0*a*b*c*d*e*f*g3*h*j2*l2*m3*n + &
&32.D0*a2*d2*e*f*g3*h*j2*l2*m3*n + &
&32.D0*a*b*c2*f2*g3*h*j2*l2*m3*n + &
&32.D0*a2*c*d*f2*g3*h*j2*l2*m3*n + &
&24.D0*b2*c2*e2*g2*h2*j2*l2*m3*n + &
&96.D0*a*b*c*d*e2*g2*h2*j2*l2*m3*n + &
&24.D0*a2*d2*e2*g2*h2*j2*l2*m3*n + &
&96.D0*a*b*c2*e*f*g2*h2*j2*l2*m3*n + &
&96.D0*a2*c*d*e*f*g2*h2*j2*l2*m3*n + &
&24.D0*a2*c2*f2*g2*h2*j2*l2*m3*n + &
&32.D0*a*b*c2*e2*g*h3*j2*l2*m3*n + &
&32.D0*a2*c*d*e2*g*h3*j2*l2*m3*n + &
&32.D0*a2*c2*e*f*g*h3*j2*l2*m3*n + &
&4.D0*a2*c2*e2*h4*j2*l2*m3*n + &
&24.D0*b2*d2*f2*g3*h*i2*k2*m2*n2 + &
&72.D0*b2*d2*e*f*g2*h2*i2*k2*m2*n2 + &
&72.D0*b2*c*d*f2*g2*h2*i2*k2*m2*n2 + &
&72.D0*a*b*d2*f2*g2*h2*i2*k2*m2*n2 + &
&24.D0*b2*d2*e2*g*h3*i2*k2*m2*n2 + &
&96.D0*b2*c*d*e*f*g*h3*i2*k2*m2*n2 + &
&96.D0*a*b*d2*e*f*g*h3*i2*k2*m2*n2 + &
&24.D0*b2*c2*f2*g*h3*i2*k2*m2*n2 + &
&96.D0*a*b*c*d*f2*g*h3*i2*k2*m2*n2 + &
&24.D0*a2*d2*f2*g*h3*i2*k2*m2*n2 + &
&12.D0*b2*c*d*e2*h4*i2*k2*m2*n2 + &
&12.D0*a*b*d2*e2*h4*i2*k2*m2*n2 + &
&12.D0*b2*c2*e*f*h4*i2*k2*m2*n2 + &
&48.D0*a*b*c*d*e*f*h4*i2*k2*m2*n2 + &
&12.D0*a2*d2*e*f*h4*i2*k2*m2*n2 + &
&12.D0*a*b*c2*f2*h4*i2*k2*m2*n2 + &
&12.D0*a2*c*d*f2*h4*i2*k2*m2*n2 + &
&12.D0*b2*d2*f2*g4*i*j*k2*m2*n2 + &
&96.D0*b2*d2*e*f*g3*h*i*j*k2*m2*n2 + &
&96.D0*b2*c*d*f2*g3*h*i*j*k2*m2*n2 + &
&96.D0*a*b*d2*f2*g3*h*i*j*k2*m2*n2 + &
&72.D0*b2*d2*e2*g2*h2*i*j*k2*m2*n2 + &
&288.D0*b2*c*d*e*f*g2*h2*i*j*k2*m2*n2 + &
&288.D0*a*b*d2*e*f*g2*h2*i*j*k2*m2*n2 + &
&72.D0*b2*c2*f2*g2*h2*i*j*k2*m2*n2 + &
&288.D0*a*b*c*d*f2*g2*h2*i*j*k2*m2*n2 + &
&72.D0*a2*d2*f2*g2*h2*i*j*k2*m2*n2 + &
&96.D0*b2*c*d*e2*g*h3*i*j*k2*m2*n2 + &
&96.D0*a*b*d2*e2*g*h3*i*j*k2*m2*n2 + &
&96.D0*b2*c2*e*f*g*h3*i*j*k2*m2*n2 + &
&384.D0*a*b*c*d*e*f*g*h3*i*j*k2*m2*n2 + &
&96.D0*a2*d2*e*f*g*h3*i*j*k2*m2*n2 + &
&96.D0*a*b*c2*f2*g*h3*i*j*k2*m2*n2 + &
&96.D0*a2*c*d*f2*g*h3*i*j*k2*m2*n2 + &
&12.D0*b2*c2*e2*h4*i*j*k2*m2*n2 + &
&48.D0*a*b*c*d*e2*h4*i*j*k2*m2*n2 + &
&12.D0*a2*d2*e2*h4*i*j*k2*m2*n2 + &
&48.D0*a*b*c2*e*f*h4*i*j*k2*m2*n2 + &
&48.D0*a2*c*d*e*f*h4*i*j*k2*m2*n2 + &
&12.D0*a2*c2*f2*h4*i*j*k2*m2*n2 + &
&12.D0*b2*d2*e*f*g4*j2*k2*m2*n2 + &
&12.D0*b2*c*d*f2*g4*j2*k2*m2*n2 + &
&12.D0*a*b*d2*f2*g4*j2*k2*m2*n2 + &
&24.D0*b2*d2*e2*g3*h*j2*k2*m2*n2 + &
&96.D0*b2*c*d*e*f*g3*h*j2*k2*m2*n2 + &
&96.D0*a*b*d2*e*f*g3*h*j2*k2*m2*n2 + &
&24.D0*b2*c2*f2*g3*h*j2*k2*m2*n2 + &
&96.D0*a*b*c*d*f2*g3*h*j2*k2*m2*n2 + &
&24.D0*a2*d2*f2*g3*h*j2*k2*m2*n2 + &
&72.D0*b2*c*d*e2*g2*h2*j2*k2*m2*n2 + &
&72.D0*a*b*d2*e2*g2*h2*j2*k2*m2*n2 + &
&72.D0*b2*c2*e*f*g2*h2*j2*k2*m2*n2 + &
&288.D0*a*b*c*d*e*f*g2*h2*j2*k2*m2*n2 + &
&72.D0*a2*d2*e*f*g2*h2*j2*k2*m2*n2 + &
&72.D0*a*b*c2*f2*g2*h2*j2*k2*m2*n2 + &
&72.D0*a2*c*d*f2*g2*h2*j2*k2*m2*n2 + &
&24.D0*b2*c2*e2*g*h3*j2*k2*m2*n2 + &
&96.D0*a*b*c*d*e2*g*h3*j2*k2*m2*n2 + &
&24.D0*a2*d2*e2*g*h3*j2*k2*m2*n2 + &
&96.D0*a*b*c2*e*f*g*h3*j2*k2*m2*n2 + &
&96.D0*a2*c*d*e*f*g*h3*j2*k2*m2*n2 + &
&24.D0*a2*c2*f2*g*h3*j2*k2*m2*n2 + &
&12.D0*a*b*c2*e2*h4*j2*k2*m2*n2 + &
&12.D0*a2*c*d*e2*h4*j2*k2*m2*n2 + &
&12.D0*a2*c2*e*f*h4*j2*k2*m2*n2 + &
&12.D0*b2*d2*f2*g4*i2*k*l*m2*n2 + &
&96.D0*b2*d2*e*f*g3*h*i2*k*l*m2*n2 + &
&96.D0*b2*c*d*f2*g3*h*i2*k*l*m2*n2 + &
&96.D0*a*b*d2*f2*g3*h*i2*k*l*m2*n2 + &
&72.D0*b2*d2*e2*g2*h2*i2*k*l*m2*n2 + &
&288.D0*b2*c*d*e*f*g2*h2*i2*k*l*m2*n2 + &
&288.D0*a*b*d2*e*f*g2*h2*i2*k*l*m2*n2 + &
&72.D0*b2*c2*f2*g2*h2*i2*k*l*m2*n2 + &
&288.D0*a*b*c*d*f2*g2*h2*i2*k*l*m2*n2 + &
&72.D0*a2*d2*f2*g2*h2*i2*k*l*m2*n2 + &
&96.D0*b2*c*d*e2*g*h3*i2*k*l*m2*n2 + &
&96.D0*a*b*d2*e2*g*h3*i2*k*l*m2*n2 + &
&96.D0*b2*c2*e*f*g*h3*i2*k*l*m2*n2 + &
&384.D0*a*b*c*d*e*f*g*h3*i2*k*l*m2*n2 + &
&96.D0*a2*d2*e*f*g*h3*i2*k*l*m2*n2 + &
&96.D0*a*b*c2*f2*g*h3*i2*k*l*m2*n2 + &
&96.D0*a2*c*d*f2*g*h3*i2*k*l*m2*n2 + &
&12.D0*b2*c2*e2*h4*i2*k*l*m2*n2 + &
&48.D0*a*b*c*d*e2*h4*i2*k*l*m2*n2 + &
&12.D0*a2*d2*e2*h4*i2*k*l*m2*n2 + &
&48.D0*a*b*c2*e*f*h4*i2*k*l*m2*n2 + &
&48.D0*a2*c*d*e*f*h4*i2*k*l*m2*n2 + &
&12.D0*a2*c2*f2*h4*i2*k*l*m2*n2 + &
&48.D0*b2*d2*e*f*g4*i*j*k*l*m2*n2 + &
&48.D0*b2*c*d*f2*g4*i*j*k*l*m2*n2 + &
&48.D0*a*b*d2*f2*g4*i*j*k*l*m2*n2 + &
&96.D0*b2*d2*e2*g3*h*i*j*k*l*m2*n2 + &
&384.D0*b2*c*d*e*f*g3*h*i*j*k*l*m2*n2 + &
&384.D0*a*b*d2*e*f*g3*h*i*j*k*l*m2*n2 + &
&96.D0*b2*c2*f2*g3*h*i*j*k*l*m2*n2 + &
&384.D0*a*b*c*d*f2*g3*h*i*j*k*l*m2*n2 + &
&96.D0*a2*d2*f2*g3*h*i*j*k*l*m2*n2 + &
&288.D0*b2*c*d*e2*g2*h2*i*j*k*l*m2*n2 + &
&288.D0*a*b*d2*e2*g2*h2*i*j*k*l*m2*n2 + &
&288.D0*b2*c2*e*f*g2*h2*i*j*k*l*m2*n2 + &
&1152.D0*a*b*c*d*e*f*g2*h2*i*j*k*l*m2*n2 + &
&288.D0*a2*d2*e*f*g2*h2*i*j*k*l*m2*n2 + &
&288.D0*a*b*c2*f2*g2*h2*i*j*k*l*m2*n2 + &
&288.D0*a2*c*d*f2*g2*h2*i*j*k*l*m2*n2 + &
&96.D0*b2*c2*e2*g*h3*i*j*k*l*m2*n2 + &
&384.D0*a*b*c*d*e2*g*h3*i*j*k*l*m2*n2 + &
&96.D0*a2*d2*e2*g*h3*i*j*k*l*m2*n2 + &
&384.D0*a*b*c2*e*f*g*h3*i*j*k*l*m2*n2 + &
&384.D0*a2*c*d*e*f*g*h3*i*j*k*l*m2*n2 + &
&96.D0*a2*c2*f2*g*h3*i*j*k*l*m2*n2 + &
&48.D0*a*b*c2*e2*h4*i*j*k*l*m2*n2 + &
&48.D0*a2*c*d*e2*h4*i*j*k*l*m2*n2 + &
&48.D0*a2*c2*e*f*h4*i*j*k*l*m2*n2 + &
&12.D0*b2*d2*e2*g4*j2*k*l*m2*n2 + &
&48.D0*b2*c*d*e*f*g4*j2*k*l*m2*n2 + &
&48.D0*a*b*d2*e*f*g4*j2*k*l*m2*n2 + &
&12.D0*b2*c2*f2*g4*j2*k*l*m2*n2 + &
&48.D0*a*b*c*d*f2*g4*j2*k*l*m2*n2 + &
&12.D0*a2*d2*f2*g4*j2*k*l*m2*n2 + &
&96.D0*b2*c*d*e2*g3*h*j2*k*l*m2*n2 + &
&96.D0*a*b*d2*e2*g3*h*j2*k*l*m2*n2 + &
&96.D0*b2*c2*e*f*g3*h*j2*k*l*m2*n2 + &
&384.D0*a*b*c*d*e*f*g3*h*j2*k*l*m2*n2 + &
&96.D0*a2*d2*e*f*g3*h*j2*k*l*m2*n2 + &
&96.D0*a*b*c2*f2*g3*h*j2*k*l*m2*n2 + &
&96.D0*a2*c*d*f2*g3*h*j2*k*l*m2*n2 + &
&72.D0*b2*c2*e2*g2*h2*j2*k*l*m2*n2 + &
&288.D0*a*b*c*d*e2*g2*h2*j2*k*l*m2*n2 + &
&72.D0*a2*d2*e2*g2*h2*j2*k*l*m2*n2 + &
&288.D0*a*b*c2*e*f*g2*h2*j2*k*l*m2*n2 + &
&288.D0*a2*c*d*e*f*g2*h2*j2*k*l*m2*n2 + &
&72.D0*a2*c2*f2*g2*h2*j2*k*l*m2*n2 + &
&96.D0*a*b*c2*e2*g*h3*j2*k*l*m2*n2 + &
&96.D0*a2*c*d*e2*g*h3*j2*k*l*m2*n2 + &
&96.D0*a2*c2*e*f*g*h3*j2*k*l*m2*n2 + &
&12.D0*a2*c2*e2*h4*j2*k*l*m2*n2 + &
&12.D0*b2*d2*e*f*g4*i2*l2*m2*n2 + &
&12.D0*b2*c*d*f2*g4*i2*l2*m2*n2 + &
&12.D0*a*b*d2*f2*g4*i2*l2*m2*n2 + &
&24.D0*b2*d2*e2*g3*h*i2*l2*m2*n2 + &
&96.D0*b2*c*d*e*f*g3*h*i2*l2*m2*n2 + &
&96.D0*a*b*d2*e*f*g3*h*i2*l2*m2*n2 + &
&24.D0*b2*c2*f2*g3*h*i2*l2*m2*n2 + &
&96.D0*a*b*c*d*f2*g3*h*i2*l2*m2*n2 + &
&24.D0*a2*d2*f2*g3*h*i2*l2*m2*n2 + &
&72.D0*b2*c*d*e2*g2*h2*i2*l2*m2*n2 + &
&72.D0*a*b*d2*e2*g2*h2*i2*l2*m2*n2 + &
&72.D0*b2*c2*e*f*g2*h2*i2*l2*m2*n2 + &
&288.D0*a*b*c*d*e*f*g2*h2*i2*l2*m2*n2 + &
&72.D0*a2*d2*e*f*g2*h2*i2*l2*m2*n2 + &
&72.D0*a*b*c2*f2*g2*h2*i2*l2*m2*n2 + &
&72.D0*a2*c*d*f2*g2*h2*i2*l2*m2*n2 + &
&24.D0*b2*c2*e2*g*h3*i2*l2*m2*n2 + &
&96.D0*a*b*c*d*e2*g*h3*i2*l2*m2*n2 + &
&24.D0*a2*d2*e2*g*h3*i2*l2*m2*n2 + &
&96.D0*a*b*c2*e*f*g*h3*i2*l2*m2*n2 + &
&96.D0*a2*c*d*e*f*g*h3*i2*l2*m2*n2 + &
&24.D0*a2*c2*f2*g*h3*i2*l2*m2*n2 + &
&12.D0*a*b*c2*e2*h4*i2*l2*m2*n2 + &
&12.D0*a2*c*d*e2*h4*i2*l2*m2*n2 + &
&12.D0*a2*c2*e*f*h4*i2*l2*m2*n2 + &
&12.D0*b2*d2*e2*g4*i*j*l2*m2*n2 + &
&48.D0*b2*c*d*e*f*g4*i*j*l2*m2*n2 + &
&48.D0*a*b*d2*e*f*g4*i*j*l2*m2*n2 + &
&12.D0*b2*c2*f2*g4*i*j*l2*m2*n2 + &
&48.D0*a*b*c*d*f2*g4*i*j*l2*m2*n2 + &
&12.D0*a2*d2*f2*g4*i*j*l2*m2*n2 + &
&96.D0*b2*c*d*e2*g3*h*i*j*l2*m2*n2 + &
&96.D0*a*b*d2*e2*g3*h*i*j*l2*m2*n2 + &
&96.D0*b2*c2*e*f*g3*h*i*j*l2*m2*n2 + &
&384.D0*a*b*c*d*e*f*g3*h*i*j*l2*m2*n2 + &
&96.D0*a2*d2*e*f*g3*h*i*j*l2*m2*n2 + &
&96.D0*a*b*c2*f2*g3*h*i*j*l2*m2*n2 + &
&96.D0*a2*c*d*f2*g3*h*i*j*l2*m2*n2 + &
&72.D0*b2*c2*e2*g2*h2*i*j*l2*m2*n2 + &
&288.D0*a*b*c*d*e2*g2*h2*i*j*l2*m2*n2 + &
&72.D0*a2*d2*e2*g2*h2*i*j*l2*m2*n2 + &
&288.D0*a*b*c2*e*f*g2*h2*i*j*l2*m2*n2 + &
&288.D0*a2*c*d*e*f*g2*h2*i*j*l2*m2*n2 + &
&72.D0*a2*c2*f2*g2*h2*i*j*l2*m2*n2 + &
&96.D0*a*b*c2*e2*g*h3*i*j*l2*m2*n2 + &
&96.D0*a2*c*d*e2*g*h3*i*j*l2*m2*n2 + &
&96.D0*a2*c2*e*f*g*h3*i*j*l2*m2*n2 + &
&12.D0*a2*c2*e2*h4*i*j*l2*m2*n2 + &
&12.D0*b2*c*d*e2*g4*j2*l2*m2*n2 + &
&12.D0*a*b*d2*e2*g4*j2*l2*m2*n2 + &
&12.D0*b2*c2*e*f*g4*j2*l2*m2*n2 + &
&48.D0*a*b*c*d*e*f*g4*j2*l2*m2*n2 + &
&12.D0*a2*d2*e*f*g4*j2*l2*m2*n2 + &
&12.D0*a*b*c2*f2*g4*j2*l2*m2*n2 + &
&12.D0*a2*c*d*f2*g4*j2*l2*m2*n2 + &
&24.D0*b2*c2*e2*g3*h*j2*l2*m2*n2 + &
&96.D0*a*b*c*d*e2*g3*h*j2*l2*m2*n2 + &
&24.D0*a2*d2*e2*g3*h*j2*l2*m2*n2 + &
&96.D0*a*b*c2*e*f*g3*h*j2*l2*m2*n2 + &
&96.D0*a2*c*d*e*f*g3*h*j2*l2*m2*n2 + &
&24.D0*a2*c2*f2*g3*h*j2*l2*m2*n2 + &
&72.D0*a*b*c2*e2*g2*h2*j2*l2*m2*n2 + &
&72.D0*a2*c*d*e2*g2*h2*j2*l2*m2*n2 + &
&72.D0*a2*c2*e*f*g2*h2*j2*l2*m2*n2 + &
&24.D0*a2*c2*e2*g*h3*j2*l2*m2*n2 + &
&4.D0*b2*d2*f2*g4*i2*k2*m*n3 + &
&32.D0*b2*d2*e*f*g3*h*i2*k2*m*n3 + &
&32.D0*b2*c*d*f2*g3*h*i2*k2*m*n3 + &
&32.D0*a*b*d2*f2*g3*h*i2*k2*m*n3 + &
&24.D0*b2*d2*e2*g2*h2*i2*k2*m*n3 + &
&96.D0*b2*c*d*e*f*g2*h2*i2*k2*m*n3 + &
&96.D0*a*b*d2*e*f*g2*h2*i2*k2*m*n3 + &
&24.D0*b2*c2*f2*g2*h2*i2*k2*m*n3 + &
&96.D0*a*b*c*d*f2*g2*h2*i2*k2*m*n3 + &
&24.D0*a2*d2*f2*g2*h2*i2*k2*m*n3 + &
&32.D0*b2*c*d*e2*g*h3*i2*k2*m*n3 + &
&32.D0*a*b*d2*e2*g*h3*i2*k2*m*n3 + &
&32.D0*b2*c2*e*f*g*h3*i2*k2*m*n3 + &
&128.D0*a*b*c*d*e*f*g*h3*i2*k2*m*n3 + &
&32.D0*a2*d2*e*f*g*h3*i2*k2*m*n3 + &
&32.D0*a*b*c2*f2*g*h3*i2*k2*m*n3 + &
&32.D0*a2*c*d*f2*g*h3*i2*k2*m*n3 + &
&4.D0*b2*c2*e2*h4*i2*k2*m*n3 + &
&16.D0*a*b*c*d*e2*h4*i2*k2*m*n3 + &
&4.D0*a2*d2*e2*h4*i2*k2*m*n3 + &
&16.D0*a*b*c2*e*f*h4*i2*k2*m*n3 + &
&16.D0*a2*c*d*e*f*h4*i2*k2*m*n3 + &
&4.D0*a2*c2*f2*h4*i2*k2*m*n3 + &
&16.D0*b2*d2*e*f*g4*i*j*k2*m*n3 + &
&16.D0*b2*c*d*f2*g4*i*j*k2*m*n3 + &
&16.D0*a*b*d2*f2*g4*i*j*k2*m*n3 + &
&32.D0*b2*d2*e2*g3*h*i*j*k2*m*n3 + &
&128.D0*b2*c*d*e*f*g3*h*i*j*k2*m*n3 + &
&128.D0*a*b*d2*e*f*g3*h*i*j*k2*m*n3 + &
&32.D0*b2*c2*f2*g3*h*i*j*k2*m*n3 + &
&128.D0*a*b*c*d*f2*g3*h*i*j*k2*m*n3 + &
&32.D0*a2*d2*f2*g3*h*i*j*k2*m*n3 + &
&96.D0*b2*c*d*e2*g2*h2*i*j*k2*m*n3 + &
&96.D0*a*b*d2*e2*g2*h2*i*j*k2*m*n3 + &
&96.D0*b2*c2*e*f*g2*h2*i*j*k2*m*n3 + &
&384.D0*a*b*c*d*e*f*g2*h2*i*j*k2*m*n3 + &
&96.D0*a2*d2*e*f*g2*h2*i*j*k2*m*n3 + &
&96.D0*a*b*c2*f2*g2*h2*i*j*k2*m*n3 + &
&96.D0*a2*c*d*f2*g2*h2*i*j*k2*m*n3 + &
&32.D0*b2*c2*e2*g*h3*i*j*k2*m*n3 + &
&128.D0*a*b*c*d*e2*g*h3*i*j*k2*m*n3 + &
&32.D0*a2*d2*e2*g*h3*i*j*k2*m*n3 + &
&128.D0*a*b*c2*e*f*g*h3*i*j*k2*m*n3 + &
&128.D0*a2*c*d*e*f*g*h3*i*j*k2*m*n3 + &
&32.D0*a2*c2*f2*g*h3*i*j*k2*m*n3 + &
&16.D0*a*b*c2*e2*h4*i*j*k2*m*n3 + &
&16.D0*a2*c*d*e2*h4*i*j*k2*m*n3 + &
&16.D0*a2*c2*e*f*h4*i*j*k2*m*n3 + &
&4.D0*b2*d2*e2*g4*j2*k2*m*n3 + &
&16.D0*b2*c*d*e*f*g4*j2*k2*m*n3 + &
&16.D0*a*b*d2*e*f*g4*j2*k2*m*n3 + &
&4.D0*b2*c2*f2*g4*j2*k2*m*n3 + &
&16.D0*a*b*c*d*f2*g4*j2*k2*m*n3 + &
&4.D0*a2*d2*f2*g4*j2*k2*m*n3 + &
&32.D0*b2*c*d*e2*g3*h*j2*k2*m*n3 + &
&32.D0*a*b*d2*e2*g3*h*j2*k2*m*n3 + &
&32.D0*b2*c2*e*f*g3*h*j2*k2*m*n3 + &
&128.D0*a*b*c*d*e*f*g3*h*j2*k2*m*n3 + &
&32.D0*a2*d2*e*f*g3*h*j2*k2*m*n3 + &
&32.D0*a*b*c2*f2*g3*h*j2*k2*m*n3 + &
&32.D0*a2*c*d*f2*g3*h*j2*k2*m*n3 + &
&24.D0*b2*c2*e2*g2*h2*j2*k2*m*n3 + &
&96.D0*a*b*c*d*e2*g2*h2*j2*k2*m*n3 + &
&24.D0*a2*d2*e2*g2*h2*j2*k2*m*n3 + &
&96.D0*a*b*c2*e*f*g2*h2*j2*k2*m*n3 + &
&96.D0*a2*c*d*e*f*g2*h2*j2*k2*m*n3 + &
&24.D0*a2*c2*f2*g2*h2*j2*k2*m*n3 + &
&32.D0*a*b*c2*e2*g*h3*j2*k2*m*n3 + &
&32.D0*a2*c*d*e2*g*h3*j2*k2*m*n3 + &
&32.D0*a2*c2*e*f*g*h3*j2*k2*m*n3 + &
&4.D0*a2*c2*e2*h4*j2*k2*m*n3 + &
&16.D0*b2*d2*e*f*g4*i2*k*l*m*n3 + &
&16.D0*b2*c*d*f2*g4*i2*k*l*m*n3 + &
&16.D0*a*b*d2*f2*g4*i2*k*l*m*n3 + &
&32.D0*b2*d2*e2*g3*h*i2*k*l*m*n3 + &
&128.D0*b2*c*d*e*f*g3*h*i2*k*l*m*n3 + &
&128.D0*a*b*d2*e*f*g3*h*i2*k*l*m*n3 + &
&32.D0*b2*c2*f2*g3*h*i2*k*l*m*n3 + &
&128.D0*a*b*c*d*f2*g3*h*i2*k*l*m*n3 + &
&32.D0*a2*d2*f2*g3*h*i2*k*l*m*n3 + &
&96.D0*b2*c*d*e2*g2*h2*i2*k*l*m*n3 + &
&96.D0*a*b*d2*e2*g2*h2*i2*k*l*m*n3 + &
&96.D0*b2*c2*e*f*g2*h2*i2*k*l*m*n3 + &
&384.D0*a*b*c*d*e*f*g2*h2*i2*k*l*m*n3 + &
&96.D0*a2*d2*e*f*g2*h2*i2*k*l*m*n3 + &
&96.D0*a*b*c2*f2*g2*h2*i2*k*l*m*n3 + &
&96.D0*a2*c*d*f2*g2*h2*i2*k*l*m*n3 + &
&32.D0*b2*c2*e2*g*h3*i2*k*l*m*n3 + &
&128.D0*a*b*c*d*e2*g*h3*i2*k*l*m*n3 + &
&32.D0*a2*d2*e2*g*h3*i2*k*l*m*n3 + &
&128.D0*a*b*c2*e*f*g*h3*i2*k*l*m*n3 + &
&128.D0*a2*c*d*e*f*g*h3*i2*k*l*m*n3 + &
&32.D0*a2*c2*f2*g*h3*i2*k*l*m*n3 + &
&16.D0*a*b*c2*e2*h4*i2*k*l*m*n3 + &
&16.D0*a2*c*d*e2*h4*i2*k*l*m*n3 + &
&16.D0*a2*c2*e*f*h4*i2*k*l*m*n3 + &
&16.D0*b2*d2*e2*g4*i*j*k*l*m*n3 + &
&64.D0*b2*c*d*e*f*g4*i*j*k*l*m*n3 + &
&64.D0*a*b*d2*e*f*g4*i*j*k*l*m*n3 + &
&16.D0*b2*c2*f2*g4*i*j*k*l*m*n3 + &
&64.D0*a*b*c*d*f2*g4*i*j*k*l*m*n3 + &
&16.D0*a2*d2*f2*g4*i*j*k*l*m*n3 + &
&128.D0*b2*c*d*e2*g3*h*i*j*k*l*m*n3 + &
&128.D0*a*b*d2*e2*g3*h*i*j*k*l*m*n3 + &
&128.D0*b2*c2*e*f*g3*h*i*j*k*l*m*n3 + &
&512.D0*a*b*c*d*e*f*g3*h*i*j*k*l*m*n3 + &
&128.D0*a2*d2*e*f*g3*h*i*j*k*l*m*n3 + &
&128.D0*a*b*c2*f2*g3*h*i*j*k*l*m*n3 + &
&128.D0*a2*c*d*f2*g3*h*i*j*k*l*m*n3 + &
&96.D0*b2*c2*e2*g2*h2*i*j*k*l*m*n3 + &
&384.D0*a*b*c*d*e2*g2*h2*i*j*k*l*m*n3 + &
&96.D0*a2*d2*e2*g2*h2*i*j*k*l*m*n3 + &
&384.D0*a*b*c2*e*f*g2*h2*i*j*k*l*m*n3 + &
&384.D0*a2*c*d*e*f*g2*h2*i*j*k*l*m*n3 + &
&96.D0*a2*c2*f2*g2*h2*i*j*k*l*m*n3 + &
&128.D0*a*b*c2*e2*g*h3*i*j*k*l*m*n3 + &
&128.D0*a2*c*d*e2*g*h3*i*j*k*l*m*n3 + &
&128.D0*a2*c2*e*f*g*h3*i*j*k*l*m*n3 + &
&16.D0*a2*c2*e2*h4*i*j*k*l*m*n3 + &
&16.D0*b2*c*d*e2*g4*j2*k*l*m*n3 + &
&16.D0*a*b*d2*e2*g4*j2*k*l*m*n3 + &
&16.D0*b2*c2*e*f*g4*j2*k*l*m*n3 + &
&64.D0*a*b*c*d*e*f*g4*j2*k*l*m*n3 + &
&16.D0*a2*d2*e*f*g4*j2*k*l*m*n3 + &
&16.D0*a*b*c2*f2*g4*j2*k*l*m*n3 + &
&16.D0*a2*c*d*f2*g4*j2*k*l*m*n3 + &
&32.D0*b2*c2*e2*g3*h*j2*k*l*m*n3 + &
&128.D0*a*b*c*d*e2*g3*h*j2*k*l*m*n3 + &
&32.D0*a2*d2*e2*g3*h*j2*k*l*m*n3 + &
&128.D0*a*b*c2*e*f*g3*h*j2*k*l*m*n3 + &
&128.D0*a2*c*d*e*f*g3*h*j2*k*l*m*n3 + &
&32.D0*a2*c2*f2*g3*h*j2*k*l*m*n3 + &
&96.D0*a*b*c2*e2*g2*h2*j2*k*l*m*n3 + &
&96.D0*a2*c*d*e2*g2*h2*j2*k*l*m*n3 + &
&96.D0*a2*c2*e*f*g2*h2*j2*k*l*m*n3 + &
&32.D0*a2*c2*e2*g*h3*j2*k*l*m*n3 + &
&4.D0*b2*d2*e2*g4*i2*l2*m*n3 + &
&16.D0*b2*c*d*e*f*g4*i2*l2*m*n3 + &
&16.D0*a*b*d2*e*f*g4*i2*l2*m*n3 + &
&4.D0*b2*c2*f2*g4*i2*l2*m*n3 + &
&16.D0*a*b*c*d*f2*g4*i2*l2*m*n3 + &
&4.D0*a2*d2*f2*g4*i2*l2*m*n3 + &
&32.D0*b2*c*d*e2*g3*h*i2*l2*m*n3 + &
&32.D0*a*b*d2*e2*g3*h*i2*l2*m*n3 + &
&32.D0*b2*c2*e*f*g3*h*i2*l2*m*n3 + &
&128.D0*a*b*c*d*e*f*g3*h*i2*l2*m*n3 + &
&32.D0*a2*d2*e*f*g3*h*i2*l2*m*n3 + &
&32.D0*a*b*c2*f2*g3*h*i2*l2*m*n3 + &
&32.D0*a2*c*d*f2*g3*h*i2*l2*m*n3 + &
&24.D0*b2*c2*e2*g2*h2*i2*l2*m*n3 + &
&96.D0*a*b*c*d*e2*g2*h2*i2*l2*m*n3 + &
&24.D0*a2*d2*e2*g2*h2*i2*l2*m*n3 + &
&96.D0*a*b*c2*e*f*g2*h2*i2*l2*m*n3 + &
&96.D0*a2*c*d*e*f*g2*h2*i2*l2*m*n3 + &
&24.D0*a2*c2*f2*g2*h2*i2*l2*m*n3 + &
&32.D0*a*b*c2*e2*g*h3*i2*l2*m*n3 + &
&32.D0*a2*c*d*e2*g*h3*i2*l2*m*n3 + &
&32.D0*a2*c2*e*f*g*h3*i2*l2*m*n3 + &
&4.D0*a2*c2*e2*h4*i2*l2*m*n3 + &
&16.D0*b2*c*d*e2*g4*i*j*l2*m*n3 + &
&16.D0*a*b*d2*e2*g4*i*j*l2*m*n3 + &
&16.D0*b2*c2*e*f*g4*i*j*l2*m*n3 + &
&64.D0*a*b*c*d*e*f*g4*i*j*l2*m*n3 + &
&16.D0*a2*d2*e*f*g4*i*j*l2*m*n3 + &
&16.D0*a*b*c2*f2*g4*i*j*l2*m*n3 + &
&16.D0*a2*c*d*f2*g4*i*j*l2*m*n3 + &
&32.D0*b2*c2*e2*g3*h*i*j*l2*m*n3 + &
&128.D0*a*b*c*d*e2*g3*h*i*j*l2*m*n3 + &
&32.D0*a2*d2*e2*g3*h*i*j*l2*m*n3 + &
&128.D0*a*b*c2*e*f*g3*h*i*j*l2*m*n3 + &
&128.D0*a2*c*d*e*f*g3*h*i*j*l2*m*n3 + &
&32.D0*a2*c2*f2*g3*h*i*j*l2*m*n3 + &
&96.D0*a*b*c2*e2*g2*h2*i*j*l2*m*n3 + &
&96.D0*a2*c*d*e2*g2*h2*i*j*l2*m*n3 + &
&96.D0*a2*c2*e*f*g2*h2*i*j*l2*m*n3 + &
&32.D0*a2*c2*e2*g*h3*i*j*l2*m*n3 + &
&4.D0*b2*c2*e2*g4*j2*l2*m*n3 + &
&16.D0*a*b*c*d*e2*g4*j2*l2*m*n3 + &
&4.D0*a2*d2*e2*g4*j2*l2*m*n3 + &
&16.D0*a*b*c2*e*f*g4*j2*l2*m*n3 + &
&16.D0*a2*c*d*e*f*g4*j2*l2*m*n3 + &
&4.D0*a2*c2*f2*g4*j2*l2*m*n3 + &
&32.D0*a*b*c2*e2*g3*h*j2*l2*m*n3 + &
&32.D0*a2*c*d*e2*g3*h*j2*l2*m*n3 + &
&32.D0*a2*c2*e*f*g3*h*j2*l2*m*n3 + &
&24.D0*a2*c2*e2*g2*h2*j2*l2*m*n3 + &
&2.D0*b2*d2*e*f*g4*i2*k2*n4 + &
&2.D0*b2*c*d*f2*g4*i2*k2*n4 + &
&2.D0*a*b*d2*f2*g4*i2*k2*n4 + &
&4.D0*b2*d2*e2*g3*h*i2*k2*n4 + &
&16.D0*b2*c*d*e*f*g3*h*i2*k2*n4 + &
&16.D0*a*b*d2*e*f*g3*h*i2*k2*n4 + &
&4.D0*b2*c2*f2*g3*h*i2*k2*n4 + &
&16.D0*a*b*c*d*f2*g3*h*i2*k2*n4 + &
&4.D0*a2*d2*f2*g3*h*i2*k2*n4 + &
&12.D0*b2*c*d*e2*g2*h2*i2*k2*n4 + &
&12.D0*a*b*d2*e2*g2*h2*i2*k2*n4 + &
&12.D0*b2*c2*e*f*g2*h2*i2*k2*n4 + &
&48.D0*a*b*c*d*e*f*g2*h2*i2*k2*n4 + &
&12.D0*a2*d2*e*f*g2*h2*i2*k2*n4 + &
&12.D0*a*b*c2*f2*g2*h2*i2*k2*n4 + &
&12.D0*a2*c*d*f2*g2*h2*i2*k2*n4 + &
&4.D0*b2*c2*e2*g*h3*i2*k2*n4 + &
&16.D0*a*b*c*d*e2*g*h3*i2*k2*n4 + &
&4.D0*a2*d2*e2*g*h3*i2*k2*n4 + &
&16.D0*a*b*c2*e*f*g*h3*i2*k2*n4 + &
&16.D0*a2*c*d*e*f*g*h3*i2*k2*n4 + &
&4.D0*a2*c2*f2*g*h3*i2*k2*n4 + &
&2.D0*a*b*c2*e2*h4*i2*k2*n4 + &
&2.D0*a2*c*d*e2*h4*i2*k2*n4 + &
&2.D0*a2*c2*e*f*h4*i2*k2*n4 + &
&2.D0*b2*d2*e2*g4*i*j*k2*n4 + &
&8.D0*b2*c*d*e*f*g4*i*j*k2*n4 + &
&8.D0*a*b*d2*e*f*g4*i*j*k2*n4 + &
&2.D0*b2*c2*f2*g4*i*j*k2*n4 + &
&8.D0*a*b*c*d*f2*g4*i*j*k2*n4 + &
&2.D0*a2*d2*f2*g4*i*j*k2*n4 + &
&16.D0*b2*c*d*e2*g3*h*i*j*k2*n4 + &
&16.D0*a*b*d2*e2*g3*h*i*j*k2*n4 + &
&16.D0*b2*c2*e*f*g3*h*i*j*k2*n4 + &
&64.D0*a*b*c*d*e*f*g3*h*i*j*k2*n4 + &
&16.D0*a2*d2*e*f*g3*h*i*j*k2*n4 + &
&16.D0*a*b*c2*f2*g3*h*i*j*k2*n4 + &
&16.D0*a2*c*d*f2*g3*h*i*j*k2*n4 + &
&12.D0*b2*c2*e2*g2*h2*i*j*k2*n4 + &
&48.D0*a*b*c*d*e2*g2*h2*i*j*k2*n4 + &
&12.D0*a2*d2*e2*g2*h2*i*j*k2*n4 + &
&48.D0*a*b*c2*e*f*g2*h2*i*j*k2*n4 + &
&48.D0*a2*c*d*e*f*g2*h2*i*j*k2*n4 + &
&12.D0*a2*c2*f2*g2*h2*i*j*k2*n4 + &
&16.D0*a*b*c2*e2*g*h3*i*j*k2*n4 + &
&16.D0*a2*c*d*e2*g*h3*i*j*k2*n4 + &
&16.D0*a2*c2*e*f*g*h3*i*j*k2*n4 + &
&2.D0*a2*c2*e2*h4*i*j*k2*n4 + &
&2.D0*b2*c*d*e2*g4*j2*k2*n4 + &
&2.D0*a*b*d2*e2*g4*j2*k2*n4 + &
&2.D0*b2*c2*e*f*g4*j2*k2*n4 + &
&8.D0*a*b*c*d*e*f*g4*j2*k2*n4 + &
&2.D0*a2*d2*e*f*g4*j2*k2*n4 + &
&2.D0*a*b*c2*f2*g4*j2*k2*n4 + &
&2.D0*a2*c*d*f2*g4*j2*k2*n4 + &
&4.D0*b2*c2*e2*g3*h*j2*k2*n4 + &
&16.D0*a*b*c*d*e2*g3*h*j2*k2*n4 + &
&4.D0*a2*d2*e2*g3*h*j2*k2*n4 + &
&16.D0*a*b*c2*e*f*g3*h*j2*k2*n4 + &
&16.D0*a2*c*d*e*f*g3*h*j2*k2*n4 + &
&4.D0*a2*c2*f2*g3*h*j2*k2*n4 + &
&12.D0*a*b*c2*e2*g2*h2*j2*k2*n4 + &
&12.D0*a2*c*d*e2*g2*h2*j2*k2*n4 + &
&12.D0*a2*c2*e*f*g2*h2*j2*k2*n4 + &
&4.D0*a2*c2*e2*g*h3*j2*k2*n4 + &
&2.D0*b2*d2*e2*g4*i2*k*l*n4 + &
&8.D0*b2*c*d*e*f*g4*i2*k*l*n4 + &
&8.D0*a*b*d2*e*f*g4*i2*k*l*n4 + &
&2.D0*b2*c2*f2*g4*i2*k*l*n4 + &
&8.D0*a*b*c*d*f2*g4*i2*k*l*n4 + &
&2.D0*a2*d2*f2*g4*i2*k*l*n4 + &
&16.D0*b2*c*d*e2*g3*h*i2*k*l*n4 + &
&16.D0*a*b*d2*e2*g3*h*i2*k*l*n4 + &
&16.D0*b2*c2*e*f*g3*h*i2*k*l*n4 + &
&64.D0*a*b*c*d*e*f*g3*h*i2*k*l*n4 + &
&16.D0*a2*d2*e*f*g3*h*i2*k*l*n4 + &
&16.D0*a*b*c2*f2*g3*h*i2*k*l*n4 + &
&16.D0*a2*c*d*f2*g3*h*i2*k*l*n4 + &
&12.D0*b2*c2*e2*g2*h2*i2*k*l*n4 + &
&48.D0*a*b*c*d*e2*g2*h2*i2*k*l*n4 + &
&12.D0*a2*d2*e2*g2*h2*i2*k*l*n4 + &
&48.D0*a*b*c2*e*f*g2*h2*i2*k*l*n4 + &
&48.D0*a2*c*d*e*f*g2*h2*i2*k*l*n4 + &
&12.D0*a2*c2*f2*g2*h2*i2*k*l*n4 + &
&16.D0*a*b*c2*e2*g*h3*i2*k*l*n4 + &
&16.D0*a2*c*d*e2*g*h3*i2*k*l*n4 + &
&16.D0*a2*c2*e*f*g*h3*i2*k*l*n4 + &
&2.D0*a2*c2*e2*h4*i2*k*l*n4 + &
&8.D0*b2*c*d*e2*g4*i*j*k*l*n4 + &
&8.D0*a*b*d2*e2*g4*i*j*k*l*n4 + &
&8.D0*b2*c2*e*f*g4*i*j*k*l*n4 + &
&32.D0*a*b*c*d*e*f*g4*i*j*k*l*n4 + &
&8.D0*a2*d2*e*f*g4*i*j*k*l*n4 + &
&8.D0*a*b*c2*f2*g4*i*j*k*l*n4 + &
&8.D0*a2*c*d*f2*g4*i*j*k*l*n4 + &
&16.D0*b2*c2*e2*g3*h*i*j*k*l*n4 + &
&64.D0*a*b*c*d*e2*g3*h*i*j*k*l*n4 + &
&16.D0*a2*d2*e2*g3*h*i*j*k*l*n4 + &
&64.D0*a*b*c2*e*f*g3*h*i*j*k*l*n4 + &
&64.D0*a2*c*d*e*f*g3*h*i*j*k*l*n4 + &
&16.D0*a2*c2*f2*g3*h*i*j*k*l*n4 + &
&48.D0*a*b*c2*e2*g2*h2*i*j*k*l*n4 + &
&48.D0*a2*c*d*e2*g2*h2*i*j*k*l*n4 + &
&48.D0*a2*c2*e*f*g2*h2*i*j*k*l*n4 + &
&16.D0*a2*c2*e2*g*h3*i*j*k*l*n4 + &
&2.D0*b2*c2*e2*g4*j2*k*l*n4 + &
&8.D0*a*b*c*d*e2*g4*j2*k*l*n4 + &
&2.D0*a2*d2*e2*g4*j2*k*l*n4 + &
&8.D0*a*b*c2*e*f*g4*j2*k*l*n4 + &
&8.D0*a2*c*d*e*f*g4*j2*k*l*n4 + &
&2.D0*a2*c2*f2*g4*j2*k*l*n4 + &
&16.D0*a*b*c2*e2*g3*h*j2*k*l*n4 + &
&16.D0*a2*c*d*e2*g3*h*j2*k*l*n4 + &
&16.D0*a2*c2*e*f*g3*h*j2*k*l*n4 + &
&12.D0*a2*c2*e2*g2*h2*j2*k*l*n4 + &
&2.D0*b2*c*d*e2*g4*i2*l2*n4 + &
&2.D0*a*b*d2*e2*g4*i2*l2*n4 + &
&2.D0*b2*c2*e*f*g4*i2*l2*n4 + &
&8.D0*a*b*c*d*e*f*g4*i2*l2*n4 + &
&2.D0*a2*d2*e*f*g4*i2*l2*n4 + &
&2.D0*a*b*c2*f2*g4*i2*l2*n4 + &
&2.D0*a2*c*d*f2*g4*i2*l2*n4 + &
&4.D0*b2*c2*e2*g3*h*i2*l2*n4 + &
&16.D0*a*b*c*d*e2*g3*h*i2*l2*n4 + &
&4.D0*a2*d2*e2*g3*h*i2*l2*n4 + &
&16.D0*a*b*c2*e*f*g3*h*i2*l2*n4 + &
&16.D0*a2*c*d*e*f*g3*h*i2*l2*n4 + &
&4.D0*a2*c2*f2*g3*h*i2*l2*n4 + &
&12.D0*a*b*c2*e2*g2*h2*i2*l2*n4 + &
&12.D0*a2*c*d*e2*g2*h2*i2*l2*n4 + &
&12.D0*a2*c2*e*f*g2*h2*i2*l2*n4 + &
&4.D0*a2*c2*e2*g*h3*i2*l2*n4 + &
&2.D0*b2*c2*e2*g4*i*j*l2*n4 + &
&8.D0*a*b*c*d*e2*g4*i*j*l2*n4 + &
&2.D0*a2*d2*e2*g4*i*j*l2*n4 + &
&8.D0*a*b*c2*e*f*g4*i*j*l2*n4 + &
&8.D0*a2*c*d*e*f*g4*i*j*l2*n4 + &
&2.D0*a2*c2*f2*g4*i*j*l2*n4 + &
&16.D0*a*b*c2*e2*g3*h*i*j*l2*n4 + &
&16.D0*a2*c*d*e2*g3*h*i*j*l2*n4 + &
&16.D0*a2*c2*e*f*g3*h*i*j*l2*n4 + &
&12.D0*a2*c2*e2*g2*h2*i*j*l2*n4 + &
&2.D0*a*b*c2*e2*g4*j2*l2*n4 + &
&2.D0*a2*c*d*e2*g4*j2*l2*n4 + &
&2.D0*a2*c2*e*f*g4*j2*l2*n4 + &
&4.D0*a2*c2*e2*g3*h*j2*l2*n4

IONIZ_PROBA(10)=b2*d2*f2*h4*i2*k2*m4 +&
&8.D0*b2*d2*f2*g*h3*i*j*k2*m4 +&
&4.D0*b2*d2*e*f*h4*i*j*k2*m4 +&
&4.D0*b2*c*d*f2*h4*i*j*k2*m4 +&
&4.D0*a*b*d2*f2*h4*i*j*k2*m4 +&
&6.D0*b2*d2*f2*g2*h2*j2*k2*m4 +&
&8.D0*b2*d2*e*f*g*h3*j2*k2*m4 +&
&8.D0*b2*c*d*f2*g*h3*j2*k2*m4 +&
&8.D0*a*b*d2*f2*g*h3*j2*k2*m4 +&
&b2*d2*e2*h4*j2*k2*m4 +&
&4.D0*b2*c*d*e*f*h4*j2*k2*m4 +&
&4.D0*a*b*d2*e*f*h4*j2*k2*m4 +&
&b2*c2*f2*h4*j2*k2*m4 +&
&4.D0*a*b*c*d*f2*h4*j2*k2*m4 +&
&a2*d2*f2*h4*j2*k2*m4 +&
&8.D0*b2*d2*f2*g*h3*i2*k*l*m4 +&
&4.D0*b2*d2*e*f*h4*i2*k*l*m4 +&
&4.D0*b2*c*d*f2*h4*i2*k*l*m4 +&
&4.D0*a*b*d2*f2*h4*i2*k*l*m4 +&
&24.D0*b2*d2*f2*g2*h2*i*j*k*l*m4 +&
&32.D0*b2*d2*e*f*g*h3*i*j*k*l*m4 +&
&32.D0*b2*c*d*f2*g*h3*i*j*k*l*m4 +&
&32.D0*a*b*d2*f2*g*h3*i*j*k*l*m4 +&
&4.D0*b2*d2*e2*h4*i*j*k*l*m4 +&
&16.D0*b2*c*d*e*f*h4*i*j*k*l*m4 +&
&16.D0*a*b*d2*e*f*h4*i*j*k*l*m4 +&
&4.D0*b2*c2*f2*h4*i*j*k*l*m4 +&
&16.D0*a*b*c*d*f2*h4*i*j*k*l*m4 +&
&4.D0*a2*d2*f2*h4*i*j*k*l*m4 +&
&8.D0*b2*d2*f2*g3*h*j2*k*l*m4 +&
&24.D0*b2*d2*e*f*g2*h2*j2*k*l*m4 +&
&24.D0*b2*c*d*f2*g2*h2*j2*k*l*m4 +&
&24.D0*a*b*d2*f2*g2*h2*j2*k*l*m4 +&
&8.D0*b2*d2*e2*g*h3*j2*k*l*m4 +&
&32.D0*b2*c*d*e*f*g*h3*j2*k*l*m4 +&
&32.D0*a*b*d2*e*f*g*h3*j2*k*l*m4 +&
&8.D0*b2*c2*f2*g*h3*j2*k*l*m4 +&
&32.D0*a*b*c*d*f2*g*h3*j2*k*l*m4 +&
&8.D0*a2*d2*f2*g*h3*j2*k*l*m4 +&
&4.D0*b2*c*d*e2*h4*j2*k*l*m4 +&
&4.D0*a*b*d2*e2*h4*j2*k*l*m4 +&
&4.D0*b2*c2*e*f*h4*j2*k*l*m4 +&
&16.D0*a*b*c*d*e*f*h4*j2*k*l*m4 +&
&4.D0*a2*d2*e*f*h4*j2*k*l*m4 +&
&4.D0*a*b*c2*f2*h4*j2*k*l*m4 +&
&4.D0*a2*c*d*f2*h4*j2*k*l*m4 +&
&6.D0*b2*d2*f2*g2*h2*i2*l2*m4 +&
&8.D0*b2*d2*e*f*g*h3*i2*l2*m4 +&
&8.D0*b2*c*d*f2*g*h3*i2*l2*m4 +&
&8.D0*a*b*d2*f2*g*h3*i2*l2*m4 +&
&b2*d2*e2*h4*i2*l2*m4 +&
&4.D0*b2*c*d*e*f*h4*i2*l2*m4 +&
&4.D0*a*b*d2*e*f*h4*i2*l2*m4 +&
&b2*c2*f2*h4*i2*l2*m4 +&
&4.D0*a*b*c*d*f2*h4*i2*l2*m4 +&
&a2*d2*f2*h4*i2*l2*m4 +&
&8.D0*b2*d2*f2*g3*h*i*j*l2*m4 +&
&24.D0*b2*d2*e*f*g2*h2*i*j*l2*m4 +&
&24.D0*b2*c*d*f2*g2*h2*i*j*l2*m4 +&
&24.D0*a*b*d2*f2*g2*h2*i*j*l2*m4 +&
&8.D0*b2*d2*e2*g*h3*i*j*l2*m4 +&
&32.D0*b2*c*d*e*f*g*h3*i*j*l2*m4 +&
&32.D0*a*b*d2*e*f*g*h3*i*j*l2*m4 +&
&8.D0*b2*c2*f2*g*h3*i*j*l2*m4 +&
&32.D0*a*b*c*d*f2*g*h3*i*j*l2*m4 +&
&8.D0*a2*d2*f2*g*h3*i*j*l2*m4 +&
&4.D0*b2*c*d*e2*h4*i*j*l2*m4 +&
&4.D0*a*b*d2*e2*h4*i*j*l2*m4 +&
&4.D0*b2*c2*e*f*h4*i*j*l2*m4 +&
&16.D0*a*b*c*d*e*f*h4*i*j*l2*m4 +&
&4.D0*a2*d2*e*f*h4*i*j*l2*m4 +&
&4.D0*a*b*c2*f2*h4*i*j*l2*m4 +&
&4.D0*a2*c*d*f2*h4*i*j*l2*m4 +&
&b2*d2*f2*g4*j2*l2*m4 +&
&8.D0*b2*d2*e*f*g3*h*j2*l2*m4 +&
&8.D0*b2*c*d*f2*g3*h*j2*l2*m4 +&
&8.D0*a*b*d2*f2*g3*h*j2*l2*m4 +&
&6.D0*b2*d2*e2*g2*h2*j2*l2*m4 +&
&24.D0*b2*c*d*e*f*g2*h2*j2*l2*m4 +&
&24.D0*a*b*d2*e*f*g2*h2*j2*l2*m4 +&
&6.D0*b2*c2*f2*g2*h2*j2*l2*m4 +&
&24.D0*a*b*c*d*f2*g2*h2*j2*l2*m4 +&
&6.D0*a2*d2*f2*g2*h2*j2*l2*m4 +&
&8.D0*b2*c*d*e2*g*h3*j2*l2*m4 +&
&8.D0*a*b*d2*e2*g*h3*j2*l2*m4 +&
&8.D0*b2*c2*e*f*g*h3*j2*l2*m4 +&
&32.D0*a*b*c*d*e*f*g*h3*j2*l2*m4 +&
&8.D0*a2*d2*e*f*g*h3*j2*l2*m4 +&
&8.D0*a*b*c2*f2*g*h3*j2*l2*m4 +&
&8.D0*a2*c*d*f2*g*h3*j2*l2*m4 +&
&b2*c2*e2*h4*j2*l2*m4 +&
&4.D0*a*b*c*d*e2*h4*j2*l2*m4 +&
&a2*d2*e2*h4*j2*l2*m4 +&
&4.D0*a*b*c2*e*f*h4*j2*l2*m4 +&
&4.D0*a2*c*d*e*f*h4*j2*l2*m4 +&
&a2*c2*f2*h4*j2*l2*m4 +&
&16.D0*b2*d2*f2*g*h3*i2*k2*m3*n +&
&8.D0*b2*d2*e*f*h4*i2*k2*m3*n +&
&8.D0*b2*c*d*f2*h4*i2*k2*m3*n +&
&8.D0*a*b*d2*f2*h4*i2*k2*m3*n +&
&48.D0*b2*d2*f2*g2*h2*i*j*k2*m3*n +&
&64.D0*b2*d2*e*f*g*h3*i*j*k2*m3*n +&
&64.D0*b2*c*d*f2*g*h3*i*j*k2*m3*n +&
&64.D0*a*b*d2*f2*g*h3*i*j*k2*m3*n +&
&8.D0*b2*d2*e2*h4*i*j*k2*m3*n +&
&32.D0*b2*c*d*e*f*h4*i*j*k2*m3*n +&
&32.D0*a*b*d2*e*f*h4*i*j*k2*m3*n +&
&8.D0*b2*c2*f2*h4*i*j*k2*m3*n +&
&32.D0*a*b*c*d*f2*h4*i*j*k2*m3*n +&
&8.D0*a2*d2*f2*h4*i*j*k2*m3*n +&
&16.D0*b2*d2*f2*g3*h*j2*k2*m3*n +&
&48.D0*b2*d2*e*f*g2*h2*j2*k2*m3*n +&
&48.D0*b2*c*d*f2*g2*h2*j2*k2*m3*n +&
&48.D0*a*b*d2*f2*g2*h2*j2*k2*m3*n +&
&16.D0*b2*d2*e2*g*h3*j2*k2*m3*n +&
&64.D0*b2*c*d*e*f*g*h3*j2*k2*m3*n +&
&64.D0*a*b*d2*e*f*g*h3*j2*k2*m3*n +&
&16.D0*b2*c2*f2*g*h3*j2*k2*m3*n +&
&64.D0*a*b*c*d*f2*g*h3*j2*k2*m3*n +&
&16.D0*a2*d2*f2*g*h3*j2*k2*m3*n +&
&8.D0*b2*c*d*e2*h4*j2*k2*m3*n +&
&8.D0*a*b*d2*e2*h4*j2*k2*m3*n +&
&8.D0*b2*c2*e*f*h4*j2*k2*m3*n +&
&32.D0*a*b*c*d*e*f*h4*j2*k2*m3*n +&
&8.D0*a2*d2*e*f*h4*j2*k2*m3*n +&
&8.D0*a*b*c2*f2*h4*j2*k2*m3*n +&
&8.D0*a2*c*d*f2*h4*j2*k2*m3*n +&
&48.D0*b2*d2*f2*g2*h2*i2*k*l*m3*n +&
&64.D0*b2*d2*e*f*g*h3*i2*k*l*m3*n +&
&64.D0*b2*c*d*f2*g*h3*i2*k*l*m3*n +&
&64.D0*a*b*d2*f2*g*h3*i2*k*l*m3*n +&
&8.D0*b2*d2*e2*h4*i2*k*l*m3*n +&
&32.D0*b2*c*d*e*f*h4*i2*k*l*m3*n +&
&32.D0*a*b*d2*e*f*h4*i2*k*l*m3*n +&
&8.D0*b2*c2*f2*h4*i2*k*l*m3*n +&
&32.D0*a*b*c*d*f2*h4*i2*k*l*m3*n +&
&8.D0*a2*d2*f2*h4*i2*k*l*m3*n +&
&64.D0*b2*d2*f2*g3*h*i*j*k*l*m3*n +&
&192.D0*b2*d2*e*f*g2*h2*i*j*k*l*m3*n +&
&192.D0*b2*c*d*f2*g2*h2*i*j*k*l*m3*n +&
&192.D0*a*b*d2*f2*g2*h2*i*j*k*l*m3*n +&
&64.D0*b2*d2*e2*g*h3*i*j*k*l*m3*n +&
&256.D0*b2*c*d*e*f*g*h3*i*j*k*l*m3*n +&
&256.D0*a*b*d2*e*f*g*h3*i*j*k*l*m3*n +&
&64.D0*b2*c2*f2*g*h3*i*j*k*l*m3*n +&
&256.D0*a*b*c*d*f2*g*h3*i*j*k*l*m3*n +&
&64.D0*a2*d2*f2*g*h3*i*j*k*l*m3*n +&
&32.D0*b2*c*d*e2*h4*i*j*k*l*m3*n +&
&32.D0*a*b*d2*e2*h4*i*j*k*l*m3*n +&
&32.D0*b2*c2*e*f*h4*i*j*k*l*m3*n +&
&128.D0*a*b*c*d*e*f*h4*i*j*k*l*m3*n +&
&32.D0*a2*d2*e*f*h4*i*j*k*l*m3*n +&
&32.D0*a*b*c2*f2*h4*i*j*k*l*m3*n +&
&32.D0*a2*c*d*f2*h4*i*j*k*l*m3*n +&
&8.D0*b2*d2*f2*g4*j2*k*l*m3*n +&
&64.D0*b2*d2*e*f*g3*h*j2*k*l*m3*n +&
&64.D0*b2*c*d*f2*g3*h*j2*k*l*m3*n +&
&64.D0*a*b*d2*f2*g3*h*j2*k*l*m3*n +&
&48.D0*b2*d2*e2*g2*h2*j2*k*l*m3*n +&
&192.D0*b2*c*d*e*f*g2*h2*j2*k*l*m3*n +&
&192.D0*a*b*d2*e*f*g2*h2*j2*k*l*m3*n +&
&48.D0*b2*c2*f2*g2*h2*j2*k*l*m3*n +&
&192.D0*a*b*c*d*f2*g2*h2*j2*k*l*m3*n +&
&48.D0*a2*d2*f2*g2*h2*j2*k*l*m3*n +&
&64.D0*b2*c*d*e2*g*h3*j2*k*l*m3*n +&
&64.D0*a*b*d2*e2*g*h3*j2*k*l*m3*n +&
&64.D0*b2*c2*e*f*g*h3*j2*k*l*m3*n +&
&256.D0*a*b*c*d*e*f*g*h3*j2*k*l*m3*n +&
&64.D0*a2*d2*e*f*g*h3*j2*k*l*m3*n +&
&64.D0*a*b*c2*f2*g*h3*j2*k*l*m3*n +&
&64.D0*a2*c*d*f2*g*h3*j2*k*l*m3*n +&
&8.D0*b2*c2*e2*h4*j2*k*l*m3*n +&
&32.D0*a*b*c*d*e2*h4*j2*k*l*m3*n +&
&8.D0*a2*d2*e2*h4*j2*k*l*m3*n +&
&32.D0*a*b*c2*e*f*h4*j2*k*l*m3*n +&
&32.D0*a2*c*d*e*f*h4*j2*k*l*m3*n +&
&8.D0*a2*c2*f2*h4*j2*k*l*m3*n +&
&16.D0*b2*d2*f2*g3*h*i2*l2*m3*n +&
&48.D0*b2*d2*e*f*g2*h2*i2*l2*m3*n +&
&48.D0*b2*c*d*f2*g2*h2*i2*l2*m3*n +&
&48.D0*a*b*d2*f2*g2*h2*i2*l2*m3*n +&
&16.D0*b2*d2*e2*g*h3*i2*l2*m3*n +&
&64.D0*b2*c*d*e*f*g*h3*i2*l2*m3*n +&
&64.D0*a*b*d2*e*f*g*h3*i2*l2*m3*n +&
&16.D0*b2*c2*f2*g*h3*i2*l2*m3*n +&
&64.D0*a*b*c*d*f2*g*h3*i2*l2*m3*n +&
&16.D0*a2*d2*f2*g*h3*i2*l2*m3*n +&
&8.D0*b2*c*d*e2*h4*i2*l2*m3*n +&
&8.D0*a*b*d2*e2*h4*i2*l2*m3*n +&
&8.D0*b2*c2*e*f*h4*i2*l2*m3*n +&
&32.D0*a*b*c*d*e*f*h4*i2*l2*m3*n +&
&8.D0*a2*d2*e*f*h4*i2*l2*m3*n +&
&8.D0*a*b*c2*f2*h4*i2*l2*m3*n +&
&8.D0*a2*c*d*f2*h4*i2*l2*m3*n +&
&8.D0*b2*d2*f2*g4*i*j*l2*m3*n +&
&64.D0*b2*d2*e*f*g3*h*i*j*l2*m3*n +&
&64.D0*b2*c*d*f2*g3*h*i*j*l2*m3*n +&
&64.D0*a*b*d2*f2*g3*h*i*j*l2*m3*n +&
&48.D0*b2*d2*e2*g2*h2*i*j*l2*m3*n +&
&192.D0*b2*c*d*e*f*g2*h2*i*j*l2*m3*n +&
&192.D0*a*b*d2*e*f*g2*h2*i*j*l2*m3*n +&
&48.D0*b2*c2*f2*g2*h2*i*j*l2*m3*n +&
&192.D0*a*b*c*d*f2*g2*h2*i*j*l2*m3*n +&
&48.D0*a2*d2*f2*g2*h2*i*j*l2*m3*n +&
&64.D0*b2*c*d*e2*g*h3*i*j*l2*m3*n +&
&64.D0*a*b*d2*e2*g*h3*i*j*l2*m3*n +&
&64.D0*b2*c2*e*f*g*h3*i*j*l2*m3*n +&
&256.D0*a*b*c*d*e*f*g*h3*i*j*l2*m3*n +&
&64.D0*a2*d2*e*f*g*h3*i*j*l2*m3*n +&
&64.D0*a*b*c2*f2*g*h3*i*j*l2*m3*n +&
&64.D0*a2*c*d*f2*g*h3*i*j*l2*m3*n +&
&8.D0*b2*c2*e2*h4*i*j*l2*m3*n +&
&32.D0*a*b*c*d*e2*h4*i*j*l2*m3*n +&
&8.D0*a2*d2*e2*h4*i*j*l2*m3*n +&
&32.D0*a*b*c2*e*f*h4*i*j*l2*m3*n +&
&32.D0*a2*c*d*e*f*h4*i*j*l2*m3*n +&
&8.D0*a2*c2*f2*h4*i*j*l2*m3*n +&
&8.D0*b2*d2*e*f*g4*j2*l2*m3*n +&
&8.D0*b2*c*d*f2*g4*j2*l2*m3*n +&
&8.D0*a*b*d2*f2*g4*j2*l2*m3*n +&
&16.D0*b2*d2*e2*g3*h*j2*l2*m3*n +&
&64.D0*b2*c*d*e*f*g3*h*j2*l2*m3*n +&
&64.D0*a*b*d2*e*f*g3*h*j2*l2*m3*n +&
&16.D0*b2*c2*f2*g3*h*j2*l2*m3*n +&
&64.D0*a*b*c*d*f2*g3*h*j2*l2*m3*n +&
&16.D0*a2*d2*f2*g3*h*j2*l2*m3*n +&
&48.D0*b2*c*d*e2*g2*h2*j2*l2*m3*n +&
&48.D0*a*b*d2*e2*g2*h2*j2*l2*m3*n +&
&48.D0*b2*c2*e*f*g2*h2*j2*l2*m3*n +&
&192.D0*a*b*c*d*e*f*g2*h2*j2*l2*m3*n +&
&48.D0*a2*d2*e*f*g2*h2*j2*l2*m3*n +&
&48.D0*a*b*c2*f2*g2*h2*j2*l2*m3*n +&
&48.D0*a2*c*d*f2*g2*h2*j2*l2*m3*n +&
&16.D0*b2*c2*e2*g*h3*j2*l2*m3*n +&
&64.D0*a*b*c*d*e2*g*h3*j2*l2*m3*n +&
&16.D0*a2*d2*e2*g*h3*j2*l2*m3*n +&
&64.D0*a*b*c2*e*f*g*h3*j2*l2*m3*n +&
&64.D0*a2*c*d*e*f*g*h3*j2*l2*m3*n +&
&16.D0*a2*c2*f2*g*h3*j2*l2*m3*n +&
&8.D0*a*b*c2*e2*h4*j2*l2*m3*n +&
&8.D0*a2*c*d*e2*h4*j2*l2*m3*n +&
&8.D0*a2*c2*e*f*h4*j2*l2*m3*n +&
&36.D0*b2*d2*f2*g2*h2*i2*k2*m2*n2 +&
&48.D0*b2*d2*e*f*g*h3*i2*k2*m2*n2 +&
&48.D0*b2*c*d*f2*g*h3*i2*k2*m2*n2 +&
&48.D0*a*b*d2*f2*g*h3*i2*k2*m2*n2 +&
&6.D0*b2*d2*e2*h4*i2*k2*m2*n2 +&
&24.D0*b2*c*d*e*f*h4*i2*k2*m2*n2 +&
&24.D0*a*b*d2*e*f*h4*i2*k2*m2*n2 +&
&6.D0*b2*c2*f2*h4*i2*k2*m2*n2 +&
&24.D0*a*b*c*d*f2*h4*i2*k2*m2*n2 +&
&6.D0*a2*d2*f2*h4*i2*k2*m2*n2 +&
&48.D0*b2*d2*f2*g3*h*i*j*k2*m2*n2 +&
&144.D0*b2*d2*e*f*g2*h2*i*j*k2*m2*n2 +&
&144.D0*b2*c*d*f2*g2*h2*i*j*k2*m2*n2 +&
&144.D0*a*b*d2*f2*g2*h2*i*j*k2*m2*n2 +&
&48.D0*b2*d2*e2*g*h3*i*j*k2*m2*n2 +&
&192.D0*b2*c*d*e*f*g*h3*i*j*k2*m2*n2 +&
&192.D0*a*b*d2*e*f*g*h3*i*j*k2*m2*n2 +&
&48.D0*b2*c2*f2*g*h3*i*j*k2*m2*n2 +&
&192.D0*a*b*c*d*f2*g*h3*i*j*k2*m2*n2 +&
&48.D0*a2*d2*f2*g*h3*i*j*k2*m2*n2 +&
&24.D0*b2*c*d*e2*h4*i*j*k2*m2*n2 +&
&24.D0*a*b*d2*e2*h4*i*j*k2*m2*n2 +&
&24.D0*b2*c2*e*f*h4*i*j*k2*m2*n2 +&
&96.D0*a*b*c*d*e*f*h4*i*j*k2*m2*n2 +&
&24.D0*a2*d2*e*f*h4*i*j*k2*m2*n2 +&
&24.D0*a*b*c2*f2*h4*i*j*k2*m2*n2 +&
&24.D0*a2*c*d*f2*h4*i*j*k2*m2*n2 +&
&6.D0*b2*d2*f2*g4*j2*k2*m2*n2 +&
&48.D0*b2*d2*e*f*g3*h*j2*k2*m2*n2 +&
&48.D0*b2*c*d*f2*g3*h*j2*k2*m2*n2 +&
&48.D0*a*b*d2*f2*g3*h*j2*k2*m2*n2 +&
&36.D0*b2*d2*e2*g2*h2*j2*k2*m2*n2 +&
&144.D0*b2*c*d*e*f*g2*h2*j2*k2*m2*n2 +&
&144.D0*a*b*d2*e*f*g2*h2*j2*k2*m2*n2 +&
&36.D0*b2*c2*f2*g2*h2*j2*k2*m2*n2 +&
&144.D0*a*b*c*d*f2*g2*h2*j2*k2*m2*n2 +&
&36.D0*a2*d2*f2*g2*h2*j2*k2*m2*n2 +&
&48.D0*b2*c*d*e2*g*h3*j2*k2*m2*n2 +&
&48.D0*a*b*d2*e2*g*h3*j2*k2*m2*n2 +&
&48.D0*b2*c2*e*f*g*h3*j2*k2*m2*n2 +&
&192.D0*a*b*c*d*e*f*g*h3*j2*k2*m2*n2 +&
&48.D0*a2*d2*e*f*g*h3*j2*k2*m2*n2 +&
&48.D0*a*b*c2*f2*g*h3*j2*k2*m2*n2 +&
&48.D0*a2*c*d*f2*g*h3*j2*k2*m2*n2 +&
&6.D0*b2*c2*e2*h4*j2*k2*m2*n2 +&
&24.D0*a*b*c*d*e2*h4*j2*k2*m2*n2 +&
&6.D0*a2*d2*e2*h4*j2*k2*m2*n2 +&
&24.D0*a*b*c2*e*f*h4*j2*k2*m2*n2 +&
&24.D0*a2*c*d*e*f*h4*j2*k2*m2*n2 +&
&6.D0*a2*c2*f2*h4*j2*k2*m2*n2 +&
&48.D0*b2*d2*f2*g3*h*i2*k*l*m2*n2 +&
&144.D0*b2*d2*e*f*g2*h2*i2*k*l*m2*n2 +&
&144.D0*b2*c*d*f2*g2*h2*i2*k*l*m2*n2 +&
&144.D0*a*b*d2*f2*g2*h2*i2*k*l*m2*n2 +&
&48.D0*b2*d2*e2*g*h3*i2*k*l*m2*n2 +&
&192.D0*b2*c*d*e*f*g*h3*i2*k*l*m2*n2 +&
&192.D0*a*b*d2*e*f*g*h3*i2*k*l*m2*n2 +&
&48.D0*b2*c2*f2*g*h3*i2*k*l*m2*n2 +&
&192.D0*a*b*c*d*f2*g*h3*i2*k*l*m2*n2 +&
&48.D0*a2*d2*f2*g*h3*i2*k*l*m2*n2 +&
&24.D0*b2*c*d*e2*h4*i2*k*l*m2*n2 +&
&24.D0*a*b*d2*e2*h4*i2*k*l*m2*n2 +&
&24.D0*b2*c2*e*f*h4*i2*k*l*m2*n2 +&
&96.D0*a*b*c*d*e*f*h4*i2*k*l*m2*n2 +&
&24.D0*a2*d2*e*f*h4*i2*k*l*m2*n2 +&
&24.D0*a*b*c2*f2*h4*i2*k*l*m2*n2 +&
&24.D0*a2*c*d*f2*h4*i2*k*l*m2*n2 +&
&24.D0*b2*d2*f2*g4*i*j*k*l*m2*n2 +&
&192.D0*b2*d2*e*f*g3*h*i*j*k*l*m2*n2 +&
&192.D0*b2*c*d*f2*g3*h*i*j*k*l*m2*n2 +&
&192.D0*a*b*d2*f2*g3*h*i*j*k*l*m2*n2 +&
&144.D0*b2*d2*e2*g2*h2*i*j*k*l*m2*n2 +&
&576.D0*b2*c*d*e*f*g2*h2*i*j*k*l*m2*n2 +&
&576.D0*a*b*d2*e*f*g2*h2*i*j*k*l*m2*n2 +&
&144.D0*b2*c2*f2*g2*h2*i*j*k*l*m2*n2 +&
&576.D0*a*b*c*d*f2*g2*h2*i*j*k*l*m2*n2 +&
&144.D0*a2*d2*f2*g2*h2*i*j*k*l*m2*n2 +&
&192.D0*b2*c*d*e2*g*h3*i*j*k*l*m2*n2 +&
&192.D0*a*b*d2*e2*g*h3*i*j*k*l*m2*n2 +&
&192.D0*b2*c2*e*f*g*h3*i*j*k*l*m2*n2 +&
&768.D0*a*b*c*d*e*f*g*h3*i*j*k*l*m2*n2 +&
&192.D0*a2*d2*e*f*g*h3*i*j*k*l*m2*n2 +&
&192.D0*a*b*c2*f2*g*h3*i*j*k*l*m2*n2 +&
&192.D0*a2*c*d*f2*g*h3*i*j*k*l*m2*n2 +&
&24.D0*b2*c2*e2*h4*i*j*k*l*m2*n2 +&
&96.D0*a*b*c*d*e2*h4*i*j*k*l*m2*n2 +&
&24.D0*a2*d2*e2*h4*i*j*k*l*m2*n2 +&
&96.D0*a*b*c2*e*f*h4*i*j*k*l*m2*n2 +&
&96.D0*a2*c*d*e*f*h4*i*j*k*l*m2*n2 +&
&24.D0*a2*c2*f2*h4*i*j*k*l*m2*n2 +&
&24.D0*b2*d2*e*f*g4*j2*k*l*m2*n2 +&
&24.D0*b2*c*d*f2*g4*j2*k*l*m2*n2 +&
&24.D0*a*b*d2*f2*g4*j2*k*l*m2*n2 +&
&48.D0*b2*d2*e2*g3*h*j2*k*l*m2*n2 +&
&192.D0*b2*c*d*e*f*g3*h*j2*k*l*m2*n2 +&
&192.D0*a*b*d2*e*f*g3*h*j2*k*l*m2*n2 +&
&48.D0*b2*c2*f2*g3*h*j2*k*l*m2*n2 +&
&192.D0*a*b*c*d*f2*g3*h*j2*k*l*m2*n2 +&
&48.D0*a2*d2*f2*g3*h*j2*k*l*m2*n2 +&
&144.D0*b2*c*d*e2*g2*h2*j2*k*l*m2*n2 +&
&144.D0*a*b*d2*e2*g2*h2*j2*k*l*m2*n2 +&
&144.D0*b2*c2*e*f*g2*h2*j2*k*l*m2*n2 +&
&576.D0*a*b*c*d*e*f*g2*h2*j2*k*l*m2*n2 +&
&144.D0*a2*d2*e*f*g2*h2*j2*k*l*m2*n2 +&
&144.D0*a*b*c2*f2*g2*h2*j2*k*l*m2*n2 +&
&144.D0*a2*c*d*f2*g2*h2*j2*k*l*m2*n2 +&
&48.D0*b2*c2*e2*g*h3*j2*k*l*m2*n2 +&
&192.D0*a*b*c*d*e2*g*h3*j2*k*l*m2*n2 +&
&48.D0*a2*d2*e2*g*h3*j2*k*l*m2*n2 +&
&192.D0*a*b*c2*e*f*g*h3*j2*k*l*m2*n2 +&
&192.D0*a2*c*d*e*f*g*h3*j2*k*l*m2*n2 +&
&48.D0*a2*c2*f2*g*h3*j2*k*l*m2*n2 +&
&24.D0*a*b*c2*e2*h4*j2*k*l*m2*n2 +&
&24.D0*a2*c*d*e2*h4*j2*k*l*m2*n2 +&
&24.D0*a2*c2*e*f*h4*j2*k*l*m2*n2 +&
&6.D0*b2*d2*f2*g4*i2*l2*m2*n2 +&
&48.D0*b2*d2*e*f*g3*h*i2*l2*m2*n2 +&
&48.D0*b2*c*d*f2*g3*h*i2*l2*m2*n2 +&
&48.D0*a*b*d2*f2*g3*h*i2*l2*m2*n2 +&
&36.D0*b2*d2*e2*g2*h2*i2*l2*m2*n2 +&
&144.D0*b2*c*d*e*f*g2*h2*i2*l2*m2*n2 +&
&144.D0*a*b*d2*e*f*g2*h2*i2*l2*m2*n2 +&
&36.D0*b2*c2*f2*g2*h2*i2*l2*m2*n2 +&
&144.D0*a*b*c*d*f2*g2*h2*i2*l2*m2*n2 +&
&36.D0*a2*d2*f2*g2*h2*i2*l2*m2*n2 +&
&48.D0*b2*c*d*e2*g*h3*i2*l2*m2*n2 +&
&48.D0*a*b*d2*e2*g*h3*i2*l2*m2*n2 +&
&48.D0*b2*c2*e*f*g*h3*i2*l2*m2*n2 +&
&192.D0*a*b*c*d*e*f*g*h3*i2*l2*m2*n2 +&
&48.D0*a2*d2*e*f*g*h3*i2*l2*m2*n2 +&
&48.D0*a*b*c2*f2*g*h3*i2*l2*m2*n2 +&
&48.D0*a2*c*d*f2*g*h3*i2*l2*m2*n2 +&
&6.D0*b2*c2*e2*h4*i2*l2*m2*n2 +&
&24.D0*a*b*c*d*e2*h4*i2*l2*m2*n2 +&
&6.D0*a2*d2*e2*h4*i2*l2*m2*n2 +&
&24.D0*a*b*c2*e*f*h4*i2*l2*m2*n2 +&
&24.D0*a2*c*d*e*f*h4*i2*l2*m2*n2 +&
&6.D0*a2*c2*f2*h4*i2*l2*m2*n2 +&
&24.D0*b2*d2*e*f*g4*i*j*l2*m2*n2 +&
&24.D0*b2*c*d*f2*g4*i*j*l2*m2*n2 +&
&24.D0*a*b*d2*f2*g4*i*j*l2*m2*n2 +&
&48.D0*b2*d2*e2*g3*h*i*j*l2*m2*n2 +&
&192.D0*b2*c*d*e*f*g3*h*i*j*l2*m2*n2 +&
&192.D0*a*b*d2*e*f*g3*h*i*j*l2*m2*n2 +&
&48.D0*b2*c2*f2*g3*h*i*j*l2*m2*n2 +&
&192.D0*a*b*c*d*f2*g3*h*i*j*l2*m2*n2 +&
&48.D0*a2*d2*f2*g3*h*i*j*l2*m2*n2 +&
&144.D0*b2*c*d*e2*g2*h2*i*j*l2*m2*n2 +&
&144.D0*a*b*d2*e2*g2*h2*i*j*l2*m2*n2 +&
&144.D0*b2*c2*e*f*g2*h2*i*j*l2*m2*n2 +&
&576.D0*a*b*c*d*e*f*g2*h2*i*j*l2*m2*n2 +&
&144.D0*a2*d2*e*f*g2*h2*i*j*l2*m2*n2 +&
&144.D0*a*b*c2*f2*g2*h2*i*j*l2*m2*n2 +&
&144.D0*a2*c*d*f2*g2*h2*i*j*l2*m2*n2 +&
&48.D0*b2*c2*e2*g*h3*i*j*l2*m2*n2 +&
&192.D0*a*b*c*d*e2*g*h3*i*j*l2*m2*n2 +&
&48.D0*a2*d2*e2*g*h3*i*j*l2*m2*n2 +&
&192.D0*a*b*c2*e*f*g*h3*i*j*l2*m2*n2 +&
&192.D0*a2*c*d*e*f*g*h3*i*j*l2*m2*n2 +&
&48.D0*a2*c2*f2*g*h3*i*j*l2*m2*n2 +&
&24.D0*a*b*c2*e2*h4*i*j*l2*m2*n2 +&
&24.D0*a2*c*d*e2*h4*i*j*l2*m2*n2 +&
&24.D0*a2*c2*e*f*h4*i*j*l2*m2*n2 +&
&6.D0*b2*d2*e2*g4*j2*l2*m2*n2 +&
&24.D0*b2*c*d*e*f*g4*j2*l2*m2*n2 +&
&24.D0*a*b*d2*e*f*g4*j2*l2*m2*n2 +&
&6.D0*b2*c2*f2*g4*j2*l2*m2*n2 +&
&24.D0*a*b*c*d*f2*g4*j2*l2*m2*n2 +&
&6.D0*a2*d2*f2*g4*j2*l2*m2*n2 +&
&48.D0*b2*c*d*e2*g3*h*j2*l2*m2*n2 +&
&48.D0*a*b*d2*e2*g3*h*j2*l2*m2*n2 +&
&48.D0*b2*c2*e*f*g3*h*j2*l2*m2*n2 +&
&192.D0*a*b*c*d*e*f*g3*h*j2*l2*m2*n2 +&
&48.D0*a2*d2*e*f*g3*h*j2*l2*m2*n2 +&
&48.D0*a*b*c2*f2*g3*h*j2*l2*m2*n2 +&
&48.D0*a2*c*d*f2*g3*h*j2*l2*m2*n2 +&
&36.D0*b2*c2*e2*g2*h2*j2*l2*m2*n2 +&
&144.D0*a*b*c*d*e2*g2*h2*j2*l2*m2*n2 +&
&36.D0*a2*d2*e2*g2*h2*j2*l2*m2*n2 +&
&144.D0*a*b*c2*e*f*g2*h2*j2*l2*m2*n2 +&
&144.D0*a2*c*d*e*f*g2*h2*j2*l2*m2*n2 +&
&36.D0*a2*c2*f2*g2*h2*j2*l2*m2*n2 +&
&48.D0*a*b*c2*e2*g*h3*j2*l2*m2*n2 +&
&48.D0*a2*c*d*e2*g*h3*j2*l2*m2*n2 +&
&48.D0*a2*c2*e*f*g*h3*j2*l2*m2*n2 +&
&6.D0*a2*c2*e2*h4*j2*l2*m2*n2 +&
&16.D0*b2*d2*f2*g3*h*i2*k2*m*n3 +&
&48.D0*b2*d2*e*f*g2*h2*i2*k2*m*n3 +&
&48.D0*b2*c*d*f2*g2*h2*i2*k2*m*n3 +&
&48.D0*a*b*d2*f2*g2*h2*i2*k2*m*n3 +&
&16.D0*b2*d2*e2*g*h3*i2*k2*m*n3 +&
&64.D0*b2*c*d*e*f*g*h3*i2*k2*m*n3 +&
&64.D0*a*b*d2*e*f*g*h3*i2*k2*m*n3 +&
&16.D0*b2*c2*f2*g*h3*i2*k2*m*n3 +&
&64.D0*a*b*c*d*f2*g*h3*i2*k2*m*n3 +&
&16.D0*a2*d2*f2*g*h3*i2*k2*m*n3 +&
&8.D0*b2*c*d*e2*h4*i2*k2*m*n3 +&
&8.D0*a*b*d2*e2*h4*i2*k2*m*n3 +&
&8.D0*b2*c2*e*f*h4*i2*k2*m*n3 +&
&32.D0*a*b*c*d*e*f*h4*i2*k2*m*n3 +&
&8.D0*a2*d2*e*f*h4*i2*k2*m*n3 +&
&8.D0*a*b*c2*f2*h4*i2*k2*m*n3 +&
&8.D0*a2*c*d*f2*h4*i2*k2*m*n3 +&
&8.D0*b2*d2*f2*g4*i*j*k2*m*n3 +&
&64.D0*b2*d2*e*f*g3*h*i*j*k2*m*n3 +&
&64.D0*b2*c*d*f2*g3*h*i*j*k2*m*n3 +&
&64.D0*a*b*d2*f2*g3*h*i*j*k2*m*n3 +&
&48.D0*b2*d2*e2*g2*h2*i*j*k2*m*n3 +&
&192.D0*b2*c*d*e*f*g2*h2*i*j*k2*m*n3 +&
&192.D0*a*b*d2*e*f*g2*h2*i*j*k2*m*n3 +&
&48.D0*b2*c2*f2*g2*h2*i*j*k2*m*n3 +&
&192.D0*a*b*c*d*f2*g2*h2*i*j*k2*m*n3 +&
&48.D0*a2*d2*f2*g2*h2*i*j*k2*m*n3 +&
&64.D0*b2*c*d*e2*g*h3*i*j*k2*m*n3 +&
&64.D0*a*b*d2*e2*g*h3*i*j*k2*m*n3 +&
&64.D0*b2*c2*e*f*g*h3*i*j*k2*m*n3 +&
&256.D0*a*b*c*d*e*f*g*h3*i*j*k2*m*n3 +&
&64.D0*a2*d2*e*f*g*h3*i*j*k2*m*n3 +&
&64.D0*a*b*c2*f2*g*h3*i*j*k2*m*n3 +&
&64.D0*a2*c*d*f2*g*h3*i*j*k2*m*n3 +&
&8.D0*b2*c2*e2*h4*i*j*k2*m*n3 +&
&32.D0*a*b*c*d*e2*h4*i*j*k2*m*n3 +&
&8.D0*a2*d2*e2*h4*i*j*k2*m*n3 +&
&32.D0*a*b*c2*e*f*h4*i*j*k2*m*n3 +&
&32.D0*a2*c*d*e*f*h4*i*j*k2*m*n3 +&
&8.D0*a2*c2*f2*h4*i*j*k2*m*n3 +&
&8.D0*b2*d2*e*f*g4*j2*k2*m*n3 +&
&8.D0*b2*c*d*f2*g4*j2*k2*m*n3 +&
&8.D0*a*b*d2*f2*g4*j2*k2*m*n3 +&
&16.D0*b2*d2*e2*g3*h*j2*k2*m*n3 +&
&64.D0*b2*c*d*e*f*g3*h*j2*k2*m*n3 +&
&64.D0*a*b*d2*e*f*g3*h*j2*k2*m*n3 +&
&16.D0*b2*c2*f2*g3*h*j2*k2*m*n3 +&
&64.D0*a*b*c*d*f2*g3*h*j2*k2*m*n3 +&
&16.D0*a2*d2*f2*g3*h*j2*k2*m*n3 +&
&48.D0*b2*c*d*e2*g2*h2*j2*k2*m*n3 +&
&48.D0*a*b*d2*e2*g2*h2*j2*k2*m*n3 +&
&48.D0*b2*c2*e*f*g2*h2*j2*k2*m*n3 +&
&192.D0*a*b*c*d*e*f*g2*h2*j2*k2*m*n3 +&
&48.D0*a2*d2*e*f*g2*h2*j2*k2*m*n3 +&
&48.D0*a*b*c2*f2*g2*h2*j2*k2*m*n3 +&
&48.D0*a2*c*d*f2*g2*h2*j2*k2*m*n3 +&
&16.D0*b2*c2*e2*g*h3*j2*k2*m*n3 +&
&64.D0*a*b*c*d*e2*g*h3*j2*k2*m*n3 +&
&16.D0*a2*d2*e2*g*h3*j2*k2*m*n3 +&
&64.D0*a*b*c2*e*f*g*h3*j2*k2*m*n3 +&
&64.D0*a2*c*d*e*f*g*h3*j2*k2*m*n3 +&
&16.D0*a2*c2*f2*g*h3*j2*k2*m*n3 +&
&8.D0*a*b*c2*e2*h4*j2*k2*m*n3 +&
&8.D0*a2*c*d*e2*h4*j2*k2*m*n3 +&
&8.D0*a2*c2*e*f*h4*j2*k2*m*n3 +&
&8.D0*b2*d2*f2*g4*i2*k*l*m*n3 +&
&64.D0*b2*d2*e*f*g3*h*i2*k*l*m*n3 +&
&64.D0*b2*c*d*f2*g3*h*i2*k*l*m*n3 +&
&64.D0*a*b*d2*f2*g3*h*i2*k*l*m*n3 +&
&48.D0*b2*d2*e2*g2*h2*i2*k*l*m*n3 +&
&192.D0*b2*c*d*e*f*g2*h2*i2*k*l*m*n3 +&
&192.D0*a*b*d2*e*f*g2*h2*i2*k*l*m*n3 +&
&48.D0*b2*c2*f2*g2*h2*i2*k*l*m*n3 +&
&192.D0*a*b*c*d*f2*g2*h2*i2*k*l*m*n3 +&
&48.D0*a2*d2*f2*g2*h2*i2*k*l*m*n3 +&
&64.D0*b2*c*d*e2*g*h3*i2*k*l*m*n3 +&
&64.D0*a*b*d2*e2*g*h3*i2*k*l*m*n3 +&
&64.D0*b2*c2*e*f*g*h3*i2*k*l*m*n3 +&
&256.D0*a*b*c*d*e*f*g*h3*i2*k*l*m*n3 +&
&64.D0*a2*d2*e*f*g*h3*i2*k*l*m*n3 +&
&64.D0*a*b*c2*f2*g*h3*i2*k*l*m*n3 +&
&64.D0*a2*c*d*f2*g*h3*i2*k*l*m*n3 +&
&8.D0*b2*c2*e2*h4*i2*k*l*m*n3 +&
&32.D0*a*b*c*d*e2*h4*i2*k*l*m*n3 +&
&8.D0*a2*d2*e2*h4*i2*k*l*m*n3 +&
&32.D0*a*b*c2*e*f*h4*i2*k*l*m*n3 +&
&32.D0*a2*c*d*e*f*h4*i2*k*l*m*n3 +&
&8.D0*a2*c2*f2*h4*i2*k*l*m*n3 +&
&32.D0*b2*d2*e*f*g4*i*j*k*l*m*n3 +&
&32.D0*b2*c*d*f2*g4*i*j*k*l*m*n3 +&
&32.D0*a*b*d2*f2*g4*i*j*k*l*m*n3 +&
&64.D0*b2*d2*e2*g3*h*i*j*k*l*m*n3 +&
&256.D0*b2*c*d*e*f*g3*h*i*j*k*l*m*n3 +&
&256.D0*a*b*d2*e*f*g3*h*i*j*k*l*m*n3 +&
&64.D0*b2*c2*f2*g3*h*i*j*k*l*m*n3 +&
&256.D0*a*b*c*d*f2*g3*h*i*j*k*l*m*n3 +&
&64.D0*a2*d2*f2*g3*h*i*j*k*l*m*n3 +&
&192.D0*b2*c*d*e2*g2*h2*i*j*k*l*m*n3 +&
&192.D0*a*b*d2*e2*g2*h2*i*j*k*l*m*n3 +&
&192.D0*b2*c2*e*f*g2*h2*i*j*k*l*m*n3 +&
&768.D0*a*b*c*d*e*f*g2*h2*i*j*k*l*m*n3 +&
&192.D0*a2*d2*e*f*g2*h2*i*j*k*l*m*n3 +&
&192.D0*a*b*c2*f2*g2*h2*i*j*k*l*m*n3 +&
&192.D0*a2*c*d*f2*g2*h2*i*j*k*l*m*n3 +&
&64.D0*b2*c2*e2*g*h3*i*j*k*l*m*n3 +&
&256.D0*a*b*c*d*e2*g*h3*i*j*k*l*m*n3 +&
&64.D0*a2*d2*e2*g*h3*i*j*k*l*m*n3 +&
&256.D0*a*b*c2*e*f*g*h3*i*j*k*l*m*n3 +&
&256.D0*a2*c*d*e*f*g*h3*i*j*k*l*m*n3 +&
&64.D0*a2*c2*f2*g*h3*i*j*k*l*m*n3 +&
&32.D0*a*b*c2*e2*h4*i*j*k*l*m*n3 +&
&32.D0*a2*c*d*e2*h4*i*j*k*l*m*n3 +&
&32.D0*a2*c2*e*f*h4*i*j*k*l*m*n3 +&
&8.D0*b2*d2*e2*g4*j2*k*l*m*n3 +&
&32.D0*b2*c*d*e*f*g4*j2*k*l*m*n3 +&
&32.D0*a*b*d2*e*f*g4*j2*k*l*m*n3 +&
&8.D0*b2*c2*f2*g4*j2*k*l*m*n3 +&
&32.D0*a*b*c*d*f2*g4*j2*k*l*m*n3 +&
&8.D0*a2*d2*f2*g4*j2*k*l*m*n3 +&
&64.D0*b2*c*d*e2*g3*h*j2*k*l*m*n3 +&
&64.D0*a*b*d2*e2*g3*h*j2*k*l*m*n3 +&
&64.D0*b2*c2*e*f*g3*h*j2*k*l*m*n3 +&
&256.D0*a*b*c*d*e*f*g3*h*j2*k*l*m*n3 +&
&64.D0*a2*d2*e*f*g3*h*j2*k*l*m*n3 +&
&64.D0*a*b*c2*f2*g3*h*j2*k*l*m*n3 +&
&64.D0*a2*c*d*f2*g3*h*j2*k*l*m*n3 +&
&48.D0*b2*c2*e2*g2*h2*j2*k*l*m*n3 +&
&192.D0*a*b*c*d*e2*g2*h2*j2*k*l*m*n3 +&
&48.D0*a2*d2*e2*g2*h2*j2*k*l*m*n3 +&
&192.D0*a*b*c2*e*f*g2*h2*j2*k*l*m*n3 +&
&192.D0*a2*c*d*e*f*g2*h2*j2*k*l*m*n3 +&
&48.D0*a2*c2*f2*g2*h2*j2*k*l*m*n3 +&
&64.D0*a*b*c2*e2*g*h3*j2*k*l*m*n3 +&
&64.D0*a2*c*d*e2*g*h3*j2*k*l*m*n3 +&
&64.D0*a2*c2*e*f*g*h3*j2*k*l*m*n3 +&
&8.D0*a2*c2*e2*h4*j2*k*l*m*n3 +&
&8.D0*b2*d2*e*f*g4*i2*l2*m*n3 +&
&8.D0*b2*c*d*f2*g4*i2*l2*m*n3 +&
&8.D0*a*b*d2*f2*g4*i2*l2*m*n3 +&
&16.D0*b2*d2*e2*g3*h*i2*l2*m*n3 +&
&64.D0*b2*c*d*e*f*g3*h*i2*l2*m*n3 +&
&64.D0*a*b*d2*e*f*g3*h*i2*l2*m*n3 +&
&16.D0*b2*c2*f2*g3*h*i2*l2*m*n3 +&
&64.D0*a*b*c*d*f2*g3*h*i2*l2*m*n3 +&
&16.D0*a2*d2*f2*g3*h*i2*l2*m*n3 +&
&48.D0*b2*c*d*e2*g2*h2*i2*l2*m*n3 +&
&48.D0*a*b*d2*e2*g2*h2*i2*l2*m*n3 +&
&48.D0*b2*c2*e*f*g2*h2*i2*l2*m*n3 +&
&192.D0*a*b*c*d*e*f*g2*h2*i2*l2*m*n3 +&
&48.D0*a2*d2*e*f*g2*h2*i2*l2*m*n3 +&
&48.D0*a*b*c2*f2*g2*h2*i2*l2*m*n3 +&
&48.D0*a2*c*d*f2*g2*h2*i2*l2*m*n3 +&
&16.D0*b2*c2*e2*g*h3*i2*l2*m*n3 +&
&64.D0*a*b*c*d*e2*g*h3*i2*l2*m*n3 +&
&16.D0*a2*d2*e2*g*h3*i2*l2*m*n3 +&
&64.D0*a*b*c2*e*f*g*h3*i2*l2*m*n3 +&
&64.D0*a2*c*d*e*f*g*h3*i2*l2*m*n3 +&
&16.D0*a2*c2*f2*g*h3*i2*l2*m*n3 +&
&8.D0*a*b*c2*e2*h4*i2*l2*m*n3 +&
&8.D0*a2*c*d*e2*h4*i2*l2*m*n3 +&
&8.D0*a2*c2*e*f*h4*i2*l2*m*n3 +&
&8.D0*b2*d2*e2*g4*i*j*l2*m*n3 +&
&32.D0*b2*c*d*e*f*g4*i*j*l2*m*n3 +&
&32.D0*a*b*d2*e*f*g4*i*j*l2*m*n3 +&
&8.D0*b2*c2*f2*g4*i*j*l2*m*n3 +&
&32.D0*a*b*c*d*f2*g4*i*j*l2*m*n3 +&
&8.D0*a2*d2*f2*g4*i*j*l2*m*n3 +&
&64.D0*b2*c*d*e2*g3*h*i*j*l2*m*n3 +&
&64.D0*a*b*d2*e2*g3*h*i*j*l2*m*n3 +&
&64.D0*b2*c2*e*f*g3*h*i*j*l2*m*n3 +&
&256.D0*a*b*c*d*e*f*g3*h*i*j*l2*m*n3 +&
&64.D0*a2*d2*e*f*g3*h*i*j*l2*m*n3 +&
&64.D0*a*b*c2*f2*g3*h*i*j*l2*m*n3 +&
&64.D0*a2*c*d*f2*g3*h*i*j*l2*m*n3 +&
&48.D0*b2*c2*e2*g2*h2*i*j*l2*m*n3 +&
&192.D0*a*b*c*d*e2*g2*h2*i*j*l2*m*n3 +&
&48.D0*a2*d2*e2*g2*h2*i*j*l2*m*n3 +&
&192.D0*a*b*c2*e*f*g2*h2*i*j*l2*m*n3 +&
&192.D0*a2*c*d*e*f*g2*h2*i*j*l2*m*n3 +&
&48.D0*a2*c2*f2*g2*h2*i*j*l2*m*n3 +&
&64.D0*a*b*c2*e2*g*h3*i*j*l2*m*n3 +&
&64.D0*a2*c*d*e2*g*h3*i*j*l2*m*n3 +&
&64.D0*a2*c2*e*f*g*h3*i*j*l2*m*n3 +&
&8.D0*a2*c2*e2*h4*i*j*l2*m*n3 +&
&8.D0*b2*c*d*e2*g4*j2*l2*m*n3 +&
&8.D0*a*b*d2*e2*g4*j2*l2*m*n3 +&
&8.D0*b2*c2*e*f*g4*j2*l2*m*n3 +&
&32.D0*a*b*c*d*e*f*g4*j2*l2*m*n3 +&
&8.D0*a2*d2*e*f*g4*j2*l2*m*n3 +&
&8.D0*a*b*c2*f2*g4*j2*l2*m*n3 +&
&8.D0*a2*c*d*f2*g4*j2*l2*m*n3 +&
&16.D0*b2*c2*e2*g3*h*j2*l2*m*n3 +&
&64.D0*a*b*c*d*e2*g3*h*j2*l2*m*n3 +&
&16.D0*a2*d2*e2*g3*h*j2*l2*m*n3 +&
&64.D0*a*b*c2*e*f*g3*h*j2*l2*m*n3 +&
&64.D0*a2*c*d*e*f*g3*h*j2*l2*m*n3 +&
&16.D0*a2*c2*f2*g3*h*j2*l2*m*n3 +&
&48.D0*a*b*c2*e2*g2*h2*j2*l2*m*n3 +&
&48.D0*a2*c*d*e2*g2*h2*j2*l2*m*n3 +&
&48.D0*a2*c2*e*f*g2*h2*j2*l2*m*n3 +&
&16.D0*a2*c2*e2*g*h3*j2*l2*m*n3 +&
&b2*d2*f2*g4*i2*k2*n4 +&
&8.D0*b2*d2*e*f*g3*h*i2*k2*n4 +&
&8.D0*b2*c*d*f2*g3*h*i2*k2*n4 +&
&8.D0*a*b*d2*f2*g3*h*i2*k2*n4 +&
&6.D0*b2*d2*e2*g2*h2*i2*k2*n4 +&
&24.D0*b2*c*d*e*f*g2*h2*i2*k2*n4 +&
&24.D0*a*b*d2*e*f*g2*h2*i2*k2*n4 +&
&6.D0*b2*c2*f2*g2*h2*i2*k2*n4 +&
&24.D0*a*b*c*d*f2*g2*h2*i2*k2*n4 +&
&6.D0*a2*d2*f2*g2*h2*i2*k2*n4 +&
&8.D0*b2*c*d*e2*g*h3*i2*k2*n4 +&
&8.D0*a*b*d2*e2*g*h3*i2*k2*n4 +&
&8.D0*b2*c2*e*f*g*h3*i2*k2*n4 +&
&32.D0*a*b*c*d*e*f*g*h3*i2*k2*n4 +&
&8.D0*a2*d2*e*f*g*h3*i2*k2*n4 +&
&8.D0*a*b*c2*f2*g*h3*i2*k2*n4 +&
&8.D0*a2*c*d*f2*g*h3*i2*k2*n4 +&
&b2*c2*e2*h4*i2*k2*n4 +&
&4.D0*a*b*c*d*e2*h4*i2*k2*n4 +&
&a2*d2*e2*h4*i2*k2*n4 +&
&4.D0*a*b*c2*e*f*h4*i2*k2*n4 +&
&4.D0*a2*c*d*e*f*h4*i2*k2*n4 +&
&a2*c2*f2*h4*i2*k2*n4 +&
&4.D0*b2*d2*e*f*g4*i*j*k2*n4 +&
&4.D0*b2*c*d*f2*g4*i*j*k2*n4 +&
&4.D0*a*b*d2*f2*g4*i*j*k2*n4 +&
&8.D0*b2*d2*e2*g3*h*i*j*k2*n4 +&
&32.D0*b2*c*d*e*f*g3*h*i*j*k2*n4 +&
&32.D0*a*b*d2*e*f*g3*h*i*j*k2*n4 +&
&8.D0*b2*c2*f2*g3*h*i*j*k2*n4 +&
&32.D0*a*b*c*d*f2*g3*h*i*j*k2*n4 +&
&8.D0*a2*d2*f2*g3*h*i*j*k2*n4 +&
&24.D0*b2*c*d*e2*g2*h2*i*j*k2*n4 +&
&24.D0*a*b*d2*e2*g2*h2*i*j*k2*n4 +&
&24.D0*b2*c2*e*f*g2*h2*i*j*k2*n4 +&
&96.D0*a*b*c*d*e*f*g2*h2*i*j*k2*n4 +&
&24.D0*a2*d2*e*f*g2*h2*i*j*k2*n4 +&
&24.D0*a*b*c2*f2*g2*h2*i*j*k2*n4 +&
&24.D0*a2*c*d*f2*g2*h2*i*j*k2*n4 +&
&8.D0*b2*c2*e2*g*h3*i*j*k2*n4 +&
&32.D0*a*b*c*d*e2*g*h3*i*j*k2*n4 +&
&8.D0*a2*d2*e2*g*h3*i*j*k2*n4 +&
&32.D0*a*b*c2*e*f*g*h3*i*j*k2*n4 +&
&32.D0*a2*c*d*e*f*g*h3*i*j*k2*n4 +&
&8.D0*a2*c2*f2*g*h3*i*j*k2*n4 +&
&4.D0*a*b*c2*e2*h4*i*j*k2*n4 +&
&4.D0*a2*c*d*e2*h4*i*j*k2*n4 +&
&4.D0*a2*c2*e*f*h4*i*j*k2*n4 +&
&b2*d2*e2*g4*j2*k2*n4 +&
&4.D0*b2*c*d*e*f*g4*j2*k2*n4 +&
&4.D0*a*b*d2*e*f*g4*j2*k2*n4 +&
&b2*c2*f2*g4*j2*k2*n4 +&
&4.D0*a*b*c*d*f2*g4*j2*k2*n4 +&
&a2*d2*f2*g4*j2*k2*n4 +&
&8.D0*b2*c*d*e2*g3*h*j2*k2*n4 +&
&8.D0*a*b*d2*e2*g3*h*j2*k2*n4 +&
&8.D0*b2*c2*e*f*g3*h*j2*k2*n4 +&
&32.D0*a*b*c*d*e*f*g3*h*j2*k2*n4 +&
&8.D0*a2*d2*e*f*g3*h*j2*k2*n4 +&
&8.D0*a*b*c2*f2*g3*h*j2*k2*n4 +&
&8.D0*a2*c*d*f2*g3*h*j2*k2*n4 +&
&6.D0*b2*c2*e2*g2*h2*j2*k2*n4 +&
&24.D0*a*b*c*d*e2*g2*h2*j2*k2*n4 +&
&6.D0*a2*d2*e2*g2*h2*j2*k2*n4 +&
&24.D0*a*b*c2*e*f*g2*h2*j2*k2*n4 +&
&24.D0*a2*c*d*e*f*g2*h2*j2*k2*n4 +&
&6.D0*a2*c2*f2*g2*h2*j2*k2*n4 +&
&8.D0*a*b*c2*e2*g*h3*j2*k2*n4 +&
&8.D0*a2*c*d*e2*g*h3*j2*k2*n4 +&
&8.D0*a2*c2*e*f*g*h3*j2*k2*n4 +&
&a2*c2*e2*h4*j2*k2*n4 +&
&4.D0*b2*d2*e*f*g4*i2*k*l*n4 +&
&4.D0*b2*c*d*f2*g4*i2*k*l*n4 +&
&4.D0*a*b*d2*f2*g4*i2*k*l*n4 +&
&8.D0*b2*d2*e2*g3*h*i2*k*l*n4 +&
&32.D0*b2*c*d*e*f*g3*h*i2*k*l*n4 +&
&32.D0*a*b*d2*e*f*g3*h*i2*k*l*n4 +&
&8.D0*b2*c2*f2*g3*h*i2*k*l*n4 +&
&32.D0*a*b*c*d*f2*g3*h*i2*k*l*n4 +&
&8.D0*a2*d2*f2*g3*h*i2*k*l*n4 +&
&24.D0*b2*c*d*e2*g2*h2*i2*k*l*n4 +&
&24.D0*a*b*d2*e2*g2*h2*i2*k*l*n4 +&
&24.D0*b2*c2*e*f*g2*h2*i2*k*l*n4 +&
&96.D0*a*b*c*d*e*f*g2*h2*i2*k*l*n4 +&
&24.D0*a2*d2*e*f*g2*h2*i2*k*l*n4 +&
&24.D0*a*b*c2*f2*g2*h2*i2*k*l*n4 +&
&24.D0*a2*c*d*f2*g2*h2*i2*k*l*n4 +&
&8.D0*b2*c2*e2*g*h3*i2*k*l*n4 +&
&32.D0*a*b*c*d*e2*g*h3*i2*k*l*n4 +&
&8.D0*a2*d2*e2*g*h3*i2*k*l*n4 +&
&32.D0*a*b*c2*e*f*g*h3*i2*k*l*n4 +&
&32.D0*a2*c*d*e*f*g*h3*i2*k*l*n4 +&
&8.D0*a2*c2*f2*g*h3*i2*k*l*n4 +&
&4.D0*a*b*c2*e2*h4*i2*k*l*n4 +&
&4.D0*a2*c*d*e2*h4*i2*k*l*n4 +&
&4.D0*a2*c2*e*f*h4*i2*k*l*n4 +&
&4.D0*b2*d2*e2*g4*i*j*k*l*n4 +&
&16.D0*b2*c*d*e*f*g4*i*j*k*l*n4 +&
&16.D0*a*b*d2*e*f*g4*i*j*k*l*n4 +&
&4.D0*b2*c2*f2*g4*i*j*k*l*n4 +&
&16.D0*a*b*c*d*f2*g4*i*j*k*l*n4 +&
&4.D0*a2*d2*f2*g4*i*j*k*l*n4 +&
&32.D0*b2*c*d*e2*g3*h*i*j*k*l*n4 +&
&32.D0*a*b*d2*e2*g3*h*i*j*k*l*n4 +&
&32.D0*b2*c2*e*f*g3*h*i*j*k*l*n4 +&
&128.D0*a*b*c*d*e*f*g3*h*i*j*k*l*n4 +&
&32.D0*a2*d2*e*f*g3*h*i*j*k*l*n4 +&
&32.D0*a*b*c2*f2*g3*h*i*j*k*l*n4 +&
&32.D0*a2*c*d*f2*g3*h*i*j*k*l*n4 +&
&24.D0*b2*c2*e2*g2*h2*i*j*k*l*n4 +&
&96.D0*a*b*c*d*e2*g2*h2*i*j*k*l*n4 +&
&24.D0*a2*d2*e2*g2*h2*i*j*k*l*n4 +&
&96.D0*a*b*c2*e*f*g2*h2*i*j*k*l*n4 +&
&96.D0*a2*c*d*e*f*g2*h2*i*j*k*l*n4 +&
&24.D0*a2*c2*f2*g2*h2*i*j*k*l*n4 +&
&32.D0*a*b*c2*e2*g*h3*i*j*k*l*n4 +&
&32.D0*a2*c*d*e2*g*h3*i*j*k*l*n4 +&
&32.D0*a2*c2*e*f*g*h3*i*j*k*l*n4 +&
&4.D0*a2*c2*e2*h4*i*j*k*l*n4 +&
&4.D0*b2*c*d*e2*g4*j2*k*l*n4 +&
&4.D0*a*b*d2*e2*g4*j2*k*l*n4 +&
&4.D0*b2*c2*e*f*g4*j2*k*l*n4 +&
&16.D0*a*b*c*d*e*f*g4*j2*k*l*n4 +&
&4.D0*a2*d2*e*f*g4*j2*k*l*n4 +&
&4.D0*a*b*c2*f2*g4*j2*k*l*n4 +&
&4.D0*a2*c*d*f2*g4*j2*k*l*n4 +&
&8.D0*b2*c2*e2*g3*h*j2*k*l*n4 +&
&32.D0*a*b*c*d*e2*g3*h*j2*k*l*n4 +&
&8.D0*a2*d2*e2*g3*h*j2*k*l*n4 +&
&32.D0*a*b*c2*e*f*g3*h*j2*k*l*n4 +&
&32.D0*a2*c*d*e*f*g3*h*j2*k*l*n4 +&
&8.D0*a2*c2*f2*g3*h*j2*k*l*n4 +&
&24.D0*a*b*c2*e2*g2*h2*j2*k*l*n4 +&
&24.D0*a2*c*d*e2*g2*h2*j2*k*l*n4 +&
&24.D0*a2*c2*e*f*g2*h2*j2*k*l*n4 +&
&8.D0*a2*c2*e2*g*h3*j2*k*l*n4 +&
&b2*d2*e2*g4*i2*l2*n4 +&
&4.D0*b2*c*d*e*f*g4*i2*l2*n4 +&
&4.D0*a*b*d2*e*f*g4*i2*l2*n4 +&
&b2*c2*f2*g4*i2*l2*n4 +&
&4.D0*a*b*c*d*f2*g4*i2*l2*n4 +&
&a2*d2*f2*g4*i2*l2*n4 +&
&8.D0*b2*c*d*e2*g3*h*i2*l2*n4 +&
&8.D0*a*b*d2*e2*g3*h*i2*l2*n4 +&
&8.D0*b2*c2*e*f*g3*h*i2*l2*n4 +&
&32.D0*a*b*c*d*e*f*g3*h*i2*l2*n4 +&
&8.D0*a2*d2*e*f*g3*h*i2*l2*n4 +&
&8.D0*a*b*c2*f2*g3*h*i2*l2*n4 +&
&8.D0*a2*c*d*f2*g3*h*i2*l2*n4 +&
&6.D0*b2*c2*e2*g2*h2*i2*l2*n4 +&
&24.D0*a*b*c*d*e2*g2*h2*i2*l2*n4 +&
&6.D0*a2*d2*e2*g2*h2*i2*l2*n4 +&
&24.D0*a*b*c2*e*f*g2*h2*i2*l2*n4 +&
&24.D0*a2*c*d*e*f*g2*h2*i2*l2*n4 +&
&6.D0*a2*c2*f2*g2*h2*i2*l2*n4 +&
&8.D0*a*b*c2*e2*g*h3*i2*l2*n4 +&
&8.D0*a2*c*d*e2*g*h3*i2*l2*n4 +&
&8.D0*a2*c2*e*f*g*h3*i2*l2*n4 +&
&a2*c2*e2*h4*i2*l2*n4 +&
&4.D0*b2*c*d*e2*g4*i*j*l2*n4 +&
&4.D0*a*b*d2*e2*g4*i*j*l2*n4 +&
&4.D0*b2*c2*e*f*g4*i*j*l2*n4 +&
&16.D0*a*b*c*d*e*f*g4*i*j*l2*n4 +&
&4.D0*a2*d2*e*f*g4*i*j*l2*n4 +&
&4.D0*a*b*c2*f2*g4*i*j*l2*n4 +&
&4.D0*a2*c*d*f2*g4*i*j*l2*n4 +&
&8.D0*b2*c2*e2*g3*h*i*j*l2*n4 +&
&32.D0*a*b*c*d*e2*g3*h*i*j*l2*n4 +&
&8.D0*a2*d2*e2*g3*h*i*j*l2*n4 +&
&32.D0*a*b*c2*e*f*g3*h*i*j*l2*n4 +&
&32.D0*a2*c*d*e*f*g3*h*i*j*l2*n4 +&
&8.D0*a2*c2*f2*g3*h*i*j*l2*n4 +&
&24.D0*a*b*c2*e2*g2*h2*i*j*l2*n4 +&
&24.D0*a2*c*d*e2*g2*h2*i*j*l2*n4 +&
&24.D0*a2*c2*e*f*g2*h2*i*j*l2*n4 +&
&8.D0*a2*c2*e2*g*h3*i*j*l2*n4 +&
&b2*c2*e2*g4*j2*l2*n4 +&
&4.D0*a*b*c*d*e2*g4*j2*l2*n4 +&
&a2*d2*e2*g4*j2*l2*n4 +&
&4.D0*a*b*c2*e*f*g4*j2*l2*n4 +&
&4.D0*a2*c*d*e*f*g4*j2*l2*n4 +&
&a2*c2*f2*g4*j2*l2*n4 +&
&8.D0*a*b*c2*e2*g3*h*j2*l2*n4 +&
&8.D0*a2*c*d*e2*g3*h*j2*l2*n4 +&
&8.D0*a2*c2*e*f*g3*h*j2*l2*n4 +&
&6.D0*a2*c2*e2*g2*h2*j2*l2*n4

IONIZ_PROBA(11)=2.D0*b2*d2*f2*h4*i*j*k2*m4 + &
&4.D0*b2*d2*f2*g*h3*j2*k2*m4 + &
&2.D0*b2*d2*e*f*h4*j2*k2*m4 + &
&2.D0*b2*c*d*f2*h4*j2*k2*m4 + &
&2.D0*a*b*d2*f2*h4*j2*k2*m4 + &
&2.D0*b2*d2*f2*h4*i2*k*l*m4 + &
&16.D0*b2*d2*f2*g*h3*i*j*k*l*m4 + &
&8.D0*b2*d2*e*f*h4*i*j*k*l*m4 + &
&8.D0*b2*c*d*f2*h4*i*j*k*l*m4 + &
&8.D0*a*b*d2*f2*h4*i*j*k*l*m4 + &
&12.D0*b2*d2*f2*g2*h2*j2*k*l*m4 + &
&16.D0*b2*d2*e*f*g*h3*j2*k*l*m4 + &
&16.D0*b2*c*d*f2*g*h3*j2*k*l*m4 + &
&16.D0*a*b*d2*f2*g*h3*j2*k*l*m4 + &
&2.D0*b2*d2*e2*h4*j2*k*l*m4 + &
&8.D0*b2*c*d*e*f*h4*j2*k*l*m4 + &
&8.D0*a*b*d2*e*f*h4*j2*k*l*m4 + &
&2.D0*b2*c2*f2*h4*j2*k*l*m4 + &
&8.D0*a*b*c*d*f2*h4*j2*k*l*m4 + &
&2.D0*a2*d2*f2*h4*j2*k*l*m4 + &
&4.D0*b2*d2*f2*g*h3*i2*l2*m4 + &
&2.D0*b2*d2*e*f*h4*i2*l2*m4 + &
&2.D0*b2*c*d*f2*h4*i2*l2*m4 + &
&2.D0*a*b*d2*f2*h4*i2*l2*m4 + &
&12.D0*b2*d2*f2*g2*h2*i*j*l2*m4 + &
&16.D0*b2*d2*e*f*g*h3*i*j*l2*m4 + &
&16.D0*b2*c*d*f2*g*h3*i*j*l2*m4 + &
&16.D0*a*b*d2*f2*g*h3*i*j*l2*m4 + &
&2.D0*b2*d2*e2*h4*i*j*l2*m4 + &
&8.D0*b2*c*d*e*f*h4*i*j*l2*m4 + &
&8.D0*a*b*d2*e*f*h4*i*j*l2*m4 + &
&2.D0*b2*c2*f2*h4*i*j*l2*m4 + &
&8.D0*a*b*c*d*f2*h4*i*j*l2*m4 + &
&2.D0*a2*d2*f2*h4*i*j*l2*m4 + &
&4.D0*b2*d2*f2*g3*h*j2*l2*m4 + &
&12.D0*b2*d2*e*f*g2*h2*j2*l2*m4 + &
&12.D0*b2*c*d*f2*g2*h2*j2*l2*m4 + &
&12.D0*a*b*d2*f2*g2*h2*j2*l2*m4 + &
&4.D0*b2*d2*e2*g*h3*j2*l2*m4 + &
&16.D0*b2*c*d*e*f*g*h3*j2*l2*m4 + &
&16.D0*a*b*d2*e*f*g*h3*j2*l2*m4 + &
&4.D0*b2*c2*f2*g*h3*j2*l2*m4 + &
&16.D0*a*b*c*d*f2*g*h3*j2*l2*m4 + &
&4.D0*a2*d2*f2*g*h3*j2*l2*m4 + &
&2.D0*b2*c*d*e2*h4*j2*l2*m4 + &
&2.D0*a*b*d2*e2*h4*j2*l2*m4 + &
&2.D0*b2*c2*e*f*h4*j2*l2*m4 + &
&8.D0*a*b*c*d*e*f*h4*j2*l2*m4 + &
&2.D0*a2*d2*e*f*h4*j2*l2*m4 + &
&2.D0*a*b*c2*f2*h4*j2*l2*m4 + &
&2.D0*a2*c*d*f2*h4*j2*l2*m4 + &
&4.D0*b2*d2*f2*h4*i2*k2*m3*n + &
&32.D0*b2*d2*f2*g*h3*i*j*k2*m3*n + &
&16.D0*b2*d2*e*f*h4*i*j*k2*m3*n + &
&16.D0*b2*c*d*f2*h4*i*j*k2*m3*n + &
&16.D0*a*b*d2*f2*h4*i*j*k2*m3*n + &
&24.D0*b2*d2*f2*g2*h2*j2*k2*m3*n + &
&32.D0*b2*d2*e*f*g*h3*j2*k2*m3*n + &
&32.D0*b2*c*d*f2*g*h3*j2*k2*m3*n + &
&32.D0*a*b*d2*f2*g*h3*j2*k2*m3*n + &
&4.D0*b2*d2*e2*h4*j2*k2*m3*n + &
&16.D0*b2*c*d*e*f*h4*j2*k2*m3*n + &
&16.D0*a*b*d2*e*f*h4*j2*k2*m3*n + &
&4.D0*b2*c2*f2*h4*j2*k2*m3*n + &
&16.D0*a*b*c*d*f2*h4*j2*k2*m3*n + &
&4.D0*a2*d2*f2*h4*j2*k2*m3*n + &
&32.D0*b2*d2*f2*g*h3*i2*k*l*m3*n + &
&16.D0*b2*d2*e*f*h4*i2*k*l*m3*n + &
&16.D0*b2*c*d*f2*h4*i2*k*l*m3*n + &
&16.D0*a*b*d2*f2*h4*i2*k*l*m3*n + &
&96.D0*b2*d2*f2*g2*h2*i*j*k*l*m3*n + &
&128.D0*b2*d2*e*f*g*h3*i*j*k*l*m3*n + &
&128.D0*b2*c*d*f2*g*h3*i*j*k*l*m3*n + &
&128.D0*a*b*d2*f2*g*h3*i*j*k*l*m3*n + &
&16.D0*b2*d2*e2*h4*i*j*k*l*m3*n + &
&64.D0*b2*c*d*e*f*h4*i*j*k*l*m3*n + &
&64.D0*a*b*d2*e*f*h4*i*j*k*l*m3*n + &
&16.D0*b2*c2*f2*h4*i*j*k*l*m3*n + &
&64.D0*a*b*c*d*f2*h4*i*j*k*l*m3*n + &
&16.D0*a2*d2*f2*h4*i*j*k*l*m3*n + &
&32.D0*b2*d2*f2*g3*h*j2*k*l*m3*n + &
&96.D0*b2*d2*e*f*g2*h2*j2*k*l*m3*n + &
&96.D0*b2*c*d*f2*g2*h2*j2*k*l*m3*n + &
&96.D0*a*b*d2*f2*g2*h2*j2*k*l*m3*n + &
&32.D0*b2*d2*e2*g*h3*j2*k*l*m3*n + &
&128.D0*b2*c*d*e*f*g*h3*j2*k*l*m3*n + &
&128.D0*a*b*d2*e*f*g*h3*j2*k*l*m3*n + &
&32.D0*b2*c2*f2*g*h3*j2*k*l*m3*n + &
&128.D0*a*b*c*d*f2*g*h3*j2*k*l*m3*n + &
&32.D0*a2*d2*f2*g*h3*j2*k*l*m3*n + &
&16.D0*b2*c*d*e2*h4*j2*k*l*m3*n + &
&16.D0*a*b*d2*e2*h4*j2*k*l*m3*n + &
&16.D0*b2*c2*e*f*h4*j2*k*l*m3*n + &
&64.D0*a*b*c*d*e*f*h4*j2*k*l*m3*n + &
&16.D0*a2*d2*e*f*h4*j2*k*l*m3*n + &
&16.D0*a*b*c2*f2*h4*j2*k*l*m3*n + &
&16.D0*a2*c*d*f2*h4*j2*k*l*m3*n + &
&24.D0*b2*d2*f2*g2*h2*i2*l2*m3*n + &
&32.D0*b2*d2*e*f*g*h3*i2*l2*m3*n + &
&32.D0*b2*c*d*f2*g*h3*i2*l2*m3*n + &
&32.D0*a*b*d2*f2*g*h3*i2*l2*m3*n + &
&4.D0*b2*d2*e2*h4*i2*l2*m3*n + &
&16.D0*b2*c*d*e*f*h4*i2*l2*m3*n + &
&16.D0*a*b*d2*e*f*h4*i2*l2*m3*n + &
&4.D0*b2*c2*f2*h4*i2*l2*m3*n + &
&16.D0*a*b*c*d*f2*h4*i2*l2*m3*n + &
&4.D0*a2*d2*f2*h4*i2*l2*m3*n + &
&32.D0*b2*d2*f2*g3*h*i*j*l2*m3*n + &
&96.D0*b2*d2*e*f*g2*h2*i*j*l2*m3*n + &
&96.D0*b2*c*d*f2*g2*h2*i*j*l2*m3*n + &
&96.D0*a*b*d2*f2*g2*h2*i*j*l2*m3*n + &
&32.D0*b2*d2*e2*g*h3*i*j*l2*m3*n + &
&128.D0*b2*c*d*e*f*g*h3*i*j*l2*m3*n + &
&128.D0*a*b*d2*e*f*g*h3*i*j*l2*m3*n + &
&32.D0*b2*c2*f2*g*h3*i*j*l2*m3*n + &
&128.D0*a*b*c*d*f2*g*h3*i*j*l2*m3*n + &
&32.D0*a2*d2*f2*g*h3*i*j*l2*m3*n + &
&16.D0*b2*c*d*e2*h4*i*j*l2*m3*n + &
&16.D0*a*b*d2*e2*h4*i*j*l2*m3*n + &
&16.D0*b2*c2*e*f*h4*i*j*l2*m3*n + &
&64.D0*a*b*c*d*e*f*h4*i*j*l2*m3*n + &
&16.D0*a2*d2*e*f*h4*i*j*l2*m3*n + &
&16.D0*a*b*c2*f2*h4*i*j*l2*m3*n + &
&16.D0*a2*c*d*f2*h4*i*j*l2*m3*n + &
&4.D0*b2*d2*f2*g4*j2*l2*m3*n + &
&32.D0*b2*d2*e*f*g3*h*j2*l2*m3*n + &
&32.D0*b2*c*d*f2*g3*h*j2*l2*m3*n + &
&32.D0*a*b*d2*f2*g3*h*j2*l2*m3*n + &
&24.D0*b2*d2*e2*g2*h2*j2*l2*m3*n + &
&96.D0*b2*c*d*e*f*g2*h2*j2*l2*m3*n + &
&96.D0*a*b*d2*e*f*g2*h2*j2*l2*m3*n + &
&24.D0*b2*c2*f2*g2*h2*j2*l2*m3*n + &
&96.D0*a*b*c*d*f2*g2*h2*j2*l2*m3*n + &
&24.D0*a2*d2*f2*g2*h2*j2*l2*m3*n + &
&32.D0*b2*c*d*e2*g*h3*j2*l2*m3*n + &
&32.D0*a*b*d2*e2*g*h3*j2*l2*m3*n + &
&32.D0*b2*c2*e*f*g*h3*j2*l2*m3*n + &
&128.D0*a*b*c*d*e*f*g*h3*j2*l2*m3*n + &
&32.D0*a2*d2*e*f*g*h3*j2*l2*m3*n + &
&32.D0*a*b*c2*f2*g*h3*j2*l2*m3*n + &
&32.D0*a2*c*d*f2*g*h3*j2*l2*m3*n + &
&4.D0*b2*c2*e2*h4*j2*l2*m3*n + &
&16.D0*a*b*c*d*e2*h4*j2*l2*m3*n + &
&4.D0*a2*d2*e2*h4*j2*l2*m3*n + &
&16.D0*a*b*c2*e*f*h4*j2*l2*m3*n + &
&16.D0*a2*c*d*e*f*h4*j2*l2*m3*n + &
&4.D0*a2*c2*f2*h4*j2*l2*m3*n + &
&24.D0*b2*d2*f2*g*h3*i2*k2*m2*n2 + &
&12.D0*b2*d2*e*f*h4*i2*k2*m2*n2 + &
&12.D0*b2*c*d*f2*h4*i2*k2*m2*n2 + &
&12.D0*a*b*d2*f2*h4*i2*k2*m2*n2 + &
&72.D0*b2*d2*f2*g2*h2*i*j*k2*m2*n2 + &
&96.D0*b2*d2*e*f*g*h3*i*j*k2*m2*n2 + &
&96.D0*b2*c*d*f2*g*h3*i*j*k2*m2*n2 + &
&96.D0*a*b*d2*f2*g*h3*i*j*k2*m2*n2 + &
&12.D0*b2*d2*e2*h4*i*j*k2*m2*n2 + &
&48.D0*b2*c*d*e*f*h4*i*j*k2*m2*n2 + &
&48.D0*a*b*d2*e*f*h4*i*j*k2*m2*n2 + &
&12.D0*b2*c2*f2*h4*i*j*k2*m2*n2 + &
&48.D0*a*b*c*d*f2*h4*i*j*k2*m2*n2 + &
&12.D0*a2*d2*f2*h4*i*j*k2*m2*n2 + &
&24.D0*b2*d2*f2*g3*h*j2*k2*m2*n2 + &
&72.D0*b2*d2*e*f*g2*h2*j2*k2*m2*n2 + &
&72.D0*b2*c*d*f2*g2*h2*j2*k2*m2*n2 + &
&72.D0*a*b*d2*f2*g2*h2*j2*k2*m2*n2 + &
&24.D0*b2*d2*e2*g*h3*j2*k2*m2*n2 + &
&96.D0*b2*c*d*e*f*g*h3*j2*k2*m2*n2 + &
&96.D0*a*b*d2*e*f*g*h3*j2*k2*m2*n2 + &
&24.D0*b2*c2*f2*g*h3*j2*k2*m2*n2 + &
&96.D0*a*b*c*d*f2*g*h3*j2*k2*m2*n2 + &
&24.D0*a2*d2*f2*g*h3*j2*k2*m2*n2 + &
&12.D0*b2*c*d*e2*h4*j2*k2*m2*n2 + &
&12.D0*a*b*d2*e2*h4*j2*k2*m2*n2 + &
&12.D0*b2*c2*e*f*h4*j2*k2*m2*n2 + &
&48.D0*a*b*c*d*e*f*h4*j2*k2*m2*n2 + &
&12.D0*a2*d2*e*f*h4*j2*k2*m2*n2 + &
&12.D0*a*b*c2*f2*h4*j2*k2*m2*n2 + &
&12.D0*a2*c*d*f2*h4*j2*k2*m2*n2 + &
&72.D0*b2*d2*f2*g2*h2*i2*k*l*m2*n2 + &
&96.D0*b2*d2*e*f*g*h3*i2*k*l*m2*n2 + &
&96.D0*b2*c*d*f2*g*h3*i2*k*l*m2*n2 + &
&96.D0*a*b*d2*f2*g*h3*i2*k*l*m2*n2 + &
&12.D0*b2*d2*e2*h4*i2*k*l*m2*n2 + &
&48.D0*b2*c*d*e*f*h4*i2*k*l*m2*n2 + &
&48.D0*a*b*d2*e*f*h4*i2*k*l*m2*n2 + &
&12.D0*b2*c2*f2*h4*i2*k*l*m2*n2 + &
&48.D0*a*b*c*d*f2*h4*i2*k*l*m2*n2 + &
&12.D0*a2*d2*f2*h4*i2*k*l*m2*n2 + &
&96.D0*b2*d2*f2*g3*h*i*j*k*l*m2*n2 + &
&288.D0*b2*d2*e*f*g2*h2*i*j*k*l*m2*n2 + &
&288.D0*b2*c*d*f2*g2*h2*i*j*k*l*m2*n2 + &
&288.D0*a*b*d2*f2*g2*h2*i*j*k*l*m2*n2 + &
&96.D0*b2*d2*e2*g*h3*i*j*k*l*m2*n2 + &
&384.D0*b2*c*d*e*f*g*h3*i*j*k*l*m2*n2 + &
&384.D0*a*b*d2*e*f*g*h3*i*j*k*l*m2*n2 + &
&96.D0*b2*c2*f2*g*h3*i*j*k*l*m2*n2 + &
&384.D0*a*b*c*d*f2*g*h3*i*j*k*l*m2*n2 + &
&96.D0*a2*d2*f2*g*h3*i*j*k*l*m2*n2 + &
&48.D0*b2*c*d*e2*h4*i*j*k*l*m2*n2 + &
&48.D0*a*b*d2*e2*h4*i*j*k*l*m2*n2 + &
&48.D0*b2*c2*e*f*h4*i*j*k*l*m2*n2 + &
&192.D0*a*b*c*d*e*f*h4*i*j*k*l*m2*n2 + &
&48.D0*a2*d2*e*f*h4*i*j*k*l*m2*n2 + &
&48.D0*a*b*c2*f2*h4*i*j*k*l*m2*n2 + &
&48.D0*a2*c*d*f2*h4*i*j*k*l*m2*n2 + &
&12.D0*b2*d2*f2*g4*j2*k*l*m2*n2 + &
&96.D0*b2*d2*e*f*g3*h*j2*k*l*m2*n2 + &
&96.D0*b2*c*d*f2*g3*h*j2*k*l*m2*n2 + &
&96.D0*a*b*d2*f2*g3*h*j2*k*l*m2*n2 + &
&72.D0*b2*d2*e2*g2*h2*j2*k*l*m2*n2 + &
&288.D0*b2*c*d*e*f*g2*h2*j2*k*l*m2*n2 + &
&288.D0*a*b*d2*e*f*g2*h2*j2*k*l*m2*n2 + &
&72.D0*b2*c2*f2*g2*h2*j2*k*l*m2*n2 + &
&288.D0*a*b*c*d*f2*g2*h2*j2*k*l*m2*n2 + &
&72.D0*a2*d2*f2*g2*h2*j2*k*l*m2*n2 + &
&96.D0*b2*c*d*e2*g*h3*j2*k*l*m2*n2 + &
&96.D0*a*b*d2*e2*g*h3*j2*k*l*m2*n2 + &
&96.D0*b2*c2*e*f*g*h3*j2*k*l*m2*n2 + &
&384.D0*a*b*c*d*e*f*g*h3*j2*k*l*m2*n2 + &
&96.D0*a2*d2*e*f*g*h3*j2*k*l*m2*n2 + &
&96.D0*a*b*c2*f2*g*h3*j2*k*l*m2*n2 + &
&96.D0*a2*c*d*f2*g*h3*j2*k*l*m2*n2 + &
&12.D0*b2*c2*e2*h4*j2*k*l*m2*n2 + &
&48.D0*a*b*c*d*e2*h4*j2*k*l*m2*n2 + &
&12.D0*a2*d2*e2*h4*j2*k*l*m2*n2 + &
&48.D0*a*b*c2*e*f*h4*j2*k*l*m2*n2 + &
&48.D0*a2*c*d*e*f*h4*j2*k*l*m2*n2 + &
&12.D0*a2*c2*f2*h4*j2*k*l*m2*n2 + &
&24.D0*b2*d2*f2*g3*h*i2*l2*m2*n2 + &
&72.D0*b2*d2*e*f*g2*h2*i2*l2*m2*n2 + &
&72.D0*b2*c*d*f2*g2*h2*i2*l2*m2*n2 + &
&72.D0*a*b*d2*f2*g2*h2*i2*l2*m2*n2 + &
&24.D0*b2*d2*e2*g*h3*i2*l2*m2*n2 + &
&96.D0*b2*c*d*e*f*g*h3*i2*l2*m2*n2 + &
&96.D0*a*b*d2*e*f*g*h3*i2*l2*m2*n2 + &
&24.D0*b2*c2*f2*g*h3*i2*l2*m2*n2 + &
&96.D0*a*b*c*d*f2*g*h3*i2*l2*m2*n2 + &
&24.D0*a2*d2*f2*g*h3*i2*l2*m2*n2 + &
&12.D0*b2*c*d*e2*h4*i2*l2*m2*n2 + &
&12.D0*a*b*d2*e2*h4*i2*l2*m2*n2 + &
&12.D0*b2*c2*e*f*h4*i2*l2*m2*n2 + &
&48.D0*a*b*c*d*e*f*h4*i2*l2*m2*n2 + &
&12.D0*a2*d2*e*f*h4*i2*l2*m2*n2 + &
&12.D0*a*b*c2*f2*h4*i2*l2*m2*n2 + &
&12.D0*a2*c*d*f2*h4*i2*l2*m2*n2 + &
&12.D0*b2*d2*f2*g4*i*j*l2*m2*n2 + &
&96.D0*b2*d2*e*f*g3*h*i*j*l2*m2*n2 + &
&96.D0*b2*c*d*f2*g3*h*i*j*l2*m2*n2 + &
&96.D0*a*b*d2*f2*g3*h*i*j*l2*m2*n2 + &
&72.D0*b2*d2*e2*g2*h2*i*j*l2*m2*n2 + &
&288.D0*b2*c*d*e*f*g2*h2*i*j*l2*m2*n2 + &
&288.D0*a*b*d2*e*f*g2*h2*i*j*l2*m2*n2 + &
&72.D0*b2*c2*f2*g2*h2*i*j*l2*m2*n2 + &
&288.D0*a*b*c*d*f2*g2*h2*i*j*l2*m2*n2 + &
&72.D0*a2*d2*f2*g2*h2*i*j*l2*m2*n2 + &
&96.D0*b2*c*d*e2*g*h3*i*j*l2*m2*n2 + &
&96.D0*a*b*d2*e2*g*h3*i*j*l2*m2*n2 + &
&96.D0*b2*c2*e*f*g*h3*i*j*l2*m2*n2 + &
&384.D0*a*b*c*d*e*f*g*h3*i*j*l2*m2*n2 + &
&96.D0*a2*d2*e*f*g*h3*i*j*l2*m2*n2 + &
&96.D0*a*b*c2*f2*g*h3*i*j*l2*m2*n2 + &
&96.D0*a2*c*d*f2*g*h3*i*j*l2*m2*n2 + &
&12.D0*b2*c2*e2*h4*i*j*l2*m2*n2 + &
&48.D0*a*b*c*d*e2*h4*i*j*l2*m2*n2 + &
&12.D0*a2*d2*e2*h4*i*j*l2*m2*n2 + &
&48.D0*a*b*c2*e*f*h4*i*j*l2*m2*n2 + &
&48.D0*a2*c*d*e*f*h4*i*j*l2*m2*n2 + &
&12.D0*a2*c2*f2*h4*i*j*l2*m2*n2 + &
&12.D0*b2*d2*e*f*g4*j2*l2*m2*n2 + &
&12.D0*b2*c*d*f2*g4*j2*l2*m2*n2 + &
&12.D0*a*b*d2*f2*g4*j2*l2*m2*n2 + &
&24.D0*b2*d2*e2*g3*h*j2*l2*m2*n2 + &
&96.D0*b2*c*d*e*f*g3*h*j2*l2*m2*n2 + &
&96.D0*a*b*d2*e*f*g3*h*j2*l2*m2*n2 + &
&24.D0*b2*c2*f2*g3*h*j2*l2*m2*n2 + &
&96.D0*a*b*c*d*f2*g3*h*j2*l2*m2*n2 + &
&24.D0*a2*d2*f2*g3*h*j2*l2*m2*n2 + &
&72.D0*b2*c*d*e2*g2*h2*j2*l2*m2*n2 + &
&72.D0*a*b*d2*e2*g2*h2*j2*l2*m2*n2 + &
&72.D0*b2*c2*e*f*g2*h2*j2*l2*m2*n2 + &
&288.D0*a*b*c*d*e*f*g2*h2*j2*l2*m2*n2 + &
&72.D0*a2*d2*e*f*g2*h2*j2*l2*m2*n2 + &
&72.D0*a*b*c2*f2*g2*h2*j2*l2*m2*n2 + &
&72.D0*a2*c*d*f2*g2*h2*j2*l2*m2*n2 + &
&24.D0*b2*c2*e2*g*h3*j2*l2*m2*n2 + &
&96.D0*a*b*c*d*e2*g*h3*j2*l2*m2*n2 + &
&24.D0*a2*d2*e2*g*h3*j2*l2*m2*n2 + &
&96.D0*a*b*c2*e*f*g*h3*j2*l2*m2*n2 + &
&96.D0*a2*c*d*e*f*g*h3*j2*l2*m2*n2 + &
&24.D0*a2*c2*f2*g*h3*j2*l2*m2*n2 + &
&12.D0*a*b*c2*e2*h4*j2*l2*m2*n2 + &
&12.D0*a2*c*d*e2*h4*j2*l2*m2*n2 + &
&12.D0*a2*c2*e*f*h4*j2*l2*m2*n2 + &
&24.D0*b2*d2*f2*g2*h2*i2*k2*m*n3 + &
&32.D0*b2*d2*e*f*g*h3*i2*k2*m*n3 + &
&32.D0*b2*c*d*f2*g*h3*i2*k2*m*n3 + &
&32.D0*a*b*d2*f2*g*h3*i2*k2*m*n3 + &
&4.D0*b2*d2*e2*h4*i2*k2*m*n3 + &
&16.D0*b2*c*d*e*f*h4*i2*k2*m*n3 + &
&16.D0*a*b*d2*e*f*h4*i2*k2*m*n3 + &
&4.D0*b2*c2*f2*h4*i2*k2*m*n3 + &
&16.D0*a*b*c*d*f2*h4*i2*k2*m*n3 + &
&4.D0*a2*d2*f2*h4*i2*k2*m*n3 + &
&32.D0*b2*d2*f2*g3*h*i*j*k2*m*n3 + &
&96.D0*b2*d2*e*f*g2*h2*i*j*k2*m*n3 + &
&96.D0*b2*c*d*f2*g2*h2*i*j*k2*m*n3 + &
&96.D0*a*b*d2*f2*g2*h2*i*j*k2*m*n3 + &
&32.D0*b2*d2*e2*g*h3*i*j*k2*m*n3 + &
&128.D0*b2*c*d*e*f*g*h3*i*j*k2*m*n3 + &
&128.D0*a*b*d2*e*f*g*h3*i*j*k2*m*n3 + &
&32.D0*b2*c2*f2*g*h3*i*j*k2*m*n3 + &
&128.D0*a*b*c*d*f2*g*h3*i*j*k2*m*n3 + &
&32.D0*a2*d2*f2*g*h3*i*j*k2*m*n3 + &
&16.D0*b2*c*d*e2*h4*i*j*k2*m*n3 + &
&16.D0*a*b*d2*e2*h4*i*j*k2*m*n3 + &
&16.D0*b2*c2*e*f*h4*i*j*k2*m*n3 + &
&64.D0*a*b*c*d*e*f*h4*i*j*k2*m*n3 + &
&16.D0*a2*d2*e*f*h4*i*j*k2*m*n3 + &
&16.D0*a*b*c2*f2*h4*i*j*k2*m*n3 + &
&16.D0*a2*c*d*f2*h4*i*j*k2*m*n3 + &
&4.D0*b2*d2*f2*g4*j2*k2*m*n3 + &
&32.D0*b2*d2*e*f*g3*h*j2*k2*m*n3 + &
&32.D0*b2*c*d*f2*g3*h*j2*k2*m*n3 + &
&32.D0*a*b*d2*f2*g3*h*j2*k2*m*n3 + &
&24.D0*b2*d2*e2*g2*h2*j2*k2*m*n3 + &
&96.D0*b2*c*d*e*f*g2*h2*j2*k2*m*n3 + &
&96.D0*a*b*d2*e*f*g2*h2*j2*k2*m*n3 + &
&24.D0*b2*c2*f2*g2*h2*j2*k2*m*n3 + &
&96.D0*a*b*c*d*f2*g2*h2*j2*k2*m*n3 + &
&24.D0*a2*d2*f2*g2*h2*j2*k2*m*n3 + &
&32.D0*b2*c*d*e2*g*h3*j2*k2*m*n3 + &
&32.D0*a*b*d2*e2*g*h3*j2*k2*m*n3 + &
&32.D0*b2*c2*e*f*g*h3*j2*k2*m*n3 + &
&128.D0*a*b*c*d*e*f*g*h3*j2*k2*m*n3 + &
&32.D0*a2*d2*e*f*g*h3*j2*k2*m*n3 + &
&32.D0*a*b*c2*f2*g*h3*j2*k2*m*n3 + &
&32.D0*a2*c*d*f2*g*h3*j2*k2*m*n3 + &
&4.D0*b2*c2*e2*h4*j2*k2*m*n3 + &
&16.D0*a*b*c*d*e2*h4*j2*k2*m*n3 + &
&4.D0*a2*d2*e2*h4*j2*k2*m*n3 + &
&16.D0*a*b*c2*e*f*h4*j2*k2*m*n3 + &
&16.D0*a2*c*d*e*f*h4*j2*k2*m*n3 + &
&4.D0*a2*c2*f2*h4*j2*k2*m*n3 + &
&32.D0*b2*d2*f2*g3*h*i2*k*l*m*n3 + &
&96.D0*b2*d2*e*f*g2*h2*i2*k*l*m*n3 + &
&96.D0*b2*c*d*f2*g2*h2*i2*k*l*m*n3 + &
&96.D0*a*b*d2*f2*g2*h2*i2*k*l*m*n3 + &
&32.D0*b2*d2*e2*g*h3*i2*k*l*m*n3 + &
&128.D0*b2*c*d*e*f*g*h3*i2*k*l*m*n3 + &
&128.D0*a*b*d2*e*f*g*h3*i2*k*l*m*n3 + &
&32.D0*b2*c2*f2*g*h3*i2*k*l*m*n3 + &
&128.D0*a*b*c*d*f2*g*h3*i2*k*l*m*n3 + &
&32.D0*a2*d2*f2*g*h3*i2*k*l*m*n3 + &
&16.D0*b2*c*d*e2*h4*i2*k*l*m*n3 + &
&16.D0*a*b*d2*e2*h4*i2*k*l*m*n3 + &
&16.D0*b2*c2*e*f*h4*i2*k*l*m*n3 + &
&64.D0*a*b*c*d*e*f*h4*i2*k*l*m*n3 + &
&16.D0*a2*d2*e*f*h4*i2*k*l*m*n3 + &
&16.D0*a*b*c2*f2*h4*i2*k*l*m*n3 + &
&16.D0*a2*c*d*f2*h4*i2*k*l*m*n3 + &
&16.D0*b2*d2*f2*g4*i*j*k*l*m*n3 + &
&128.D0*b2*d2*e*f*g3*h*i*j*k*l*m*n3 + &
&128.D0*b2*c*d*f2*g3*h*i*j*k*l*m*n3 + &
&128.D0*a*b*d2*f2*g3*h*i*j*k*l*m*n3 + &
&96.D0*b2*d2*e2*g2*h2*i*j*k*l*m*n3 + &
&384.D0*b2*c*d*e*f*g2*h2*i*j*k*l*m*n3 + &
&384.D0*a*b*d2*e*f*g2*h2*i*j*k*l*m*n3 + &
&96.D0*b2*c2*f2*g2*h2*i*j*k*l*m*n3 + &
&384.D0*a*b*c*d*f2*g2*h2*i*j*k*l*m*n3 + &
&96.D0*a2*d2*f2*g2*h2*i*j*k*l*m*n3 + &
&128.D0*b2*c*d*e2*g*h3*i*j*k*l*m*n3 + &
&128.D0*a*b*d2*e2*g*h3*i*j*k*l*m*n3 + &
&128.D0*b2*c2*e*f*g*h3*i*j*k*l*m*n3 + &
&512.D0*a*b*c*d*e*f*g*h3*i*j*k*l*m*n3 + &
&128.D0*a2*d2*e*f*g*h3*i*j*k*l*m*n3 + &
&128.D0*a*b*c2*f2*g*h3*i*j*k*l*m*n3 + &
&128.D0*a2*c*d*f2*g*h3*i*j*k*l*m*n3 + &
&16.D0*b2*c2*e2*h4*i*j*k*l*m*n3 + &
&64.D0*a*b*c*d*e2*h4*i*j*k*l*m*n3 + &
&16.D0*a2*d2*e2*h4*i*j*k*l*m*n3 + &
&64.D0*a*b*c2*e*f*h4*i*j*k*l*m*n3 + &
&64.D0*a2*c*d*e*f*h4*i*j*k*l*m*n3 + &
&16.D0*a2*c2*f2*h4*i*j*k*l*m*n3 + &
&16.D0*b2*d2*e*f*g4*j2*k*l*m*n3 + &
&16.D0*b2*c*d*f2*g4*j2*k*l*m*n3 + &
&16.D0*a*b*d2*f2*g4*j2*k*l*m*n3 + &
&32.D0*b2*d2*e2*g3*h*j2*k*l*m*n3 + &
&128.D0*b2*c*d*e*f*g3*h*j2*k*l*m*n3 + &
&128.D0*a*b*d2*e*f*g3*h*j2*k*l*m*n3 + &
&32.D0*b2*c2*f2*g3*h*j2*k*l*m*n3 + &
&128.D0*a*b*c*d*f2*g3*h*j2*k*l*m*n3 + &
&32.D0*a2*d2*f2*g3*h*j2*k*l*m*n3 + &
&96.D0*b2*c*d*e2*g2*h2*j2*k*l*m*n3 + &
&96.D0*a*b*d2*e2*g2*h2*j2*k*l*m*n3 + &
&96.D0*b2*c2*e*f*g2*h2*j2*k*l*m*n3 + &
&384.D0*a*b*c*d*e*f*g2*h2*j2*k*l*m*n3 + &
&96.D0*a2*d2*e*f*g2*h2*j2*k*l*m*n3 + &
&96.D0*a*b*c2*f2*g2*h2*j2*k*l*m*n3 + &
&96.D0*a2*c*d*f2*g2*h2*j2*k*l*m*n3 + &
&32.D0*b2*c2*e2*g*h3*j2*k*l*m*n3 + &
&128.D0*a*b*c*d*e2*g*h3*j2*k*l*m*n3 + &
&32.D0*a2*d2*e2*g*h3*j2*k*l*m*n3 + &
&128.D0*a*b*c2*e*f*g*h3*j2*k*l*m*n3 + &
&128.D0*a2*c*d*e*f*g*h3*j2*k*l*m*n3 + &
&32.D0*a2*c2*f2*g*h3*j2*k*l*m*n3 + &
&16.D0*a*b*c2*e2*h4*j2*k*l*m*n3 + &
&16.D0*a2*c*d*e2*h4*j2*k*l*m*n3 + &
&16.D0*a2*c2*e*f*h4*j2*k*l*m*n3 + &
&4.D0*b2*d2*f2*g4*i2*l2*m*n3 + &
&32.D0*b2*d2*e*f*g3*h*i2*l2*m*n3 + &
&32.D0*b2*c*d*f2*g3*h*i2*l2*m*n3 + &
&32.D0*a*b*d2*f2*g3*h*i2*l2*m*n3 + &
&24.D0*b2*d2*e2*g2*h2*i2*l2*m*n3 + &
&96.D0*b2*c*d*e*f*g2*h2*i2*l2*m*n3 + &
&96.D0*a*b*d2*e*f*g2*h2*i2*l2*m*n3 + &
&24.D0*b2*c2*f2*g2*h2*i2*l2*m*n3 + &
&96.D0*a*b*c*d*f2*g2*h2*i2*l2*m*n3 + &
&24.D0*a2*d2*f2*g2*h2*i2*l2*m*n3 + &
&32.D0*b2*c*d*e2*g*h3*i2*l2*m*n3 + &
&32.D0*a*b*d2*e2*g*h3*i2*l2*m*n3 + &
&32.D0*b2*c2*e*f*g*h3*i2*l2*m*n3 + &
&128.D0*a*b*c*d*e*f*g*h3*i2*l2*m*n3 + &
&32.D0*a2*d2*e*f*g*h3*i2*l2*m*n3 + &
&32.D0*a*b*c2*f2*g*h3*i2*l2*m*n3 + &
&32.D0*a2*c*d*f2*g*h3*i2*l2*m*n3 + &
&4.D0*b2*c2*e2*h4*i2*l2*m*n3 + &
&16.D0*a*b*c*d*e2*h4*i2*l2*m*n3 + &
&4.D0*a2*d2*e2*h4*i2*l2*m*n3 + &
&16.D0*a*b*c2*e*f*h4*i2*l2*m*n3 + &
&16.D0*a2*c*d*e*f*h4*i2*l2*m*n3 + &
&4.D0*a2*c2*f2*h4*i2*l2*m*n3 + &
&16.D0*b2*d2*e*f*g4*i*j*l2*m*n3 + &
&16.D0*b2*c*d*f2*g4*i*j*l2*m*n3 + &
&16.D0*a*b*d2*f2*g4*i*j*l2*m*n3 + &
&32.D0*b2*d2*e2*g3*h*i*j*l2*m*n3 + &
&128.D0*b2*c*d*e*f*g3*h*i*j*l2*m*n3 + &
&128.D0*a*b*d2*e*f*g3*h*i*j*l2*m*n3 + &
&32.D0*b2*c2*f2*g3*h*i*j*l2*m*n3 + &
&128.D0*a*b*c*d*f2*g3*h*i*j*l2*m*n3 + &
&32.D0*a2*d2*f2*g3*h*i*j*l2*m*n3 + &
&96.D0*b2*c*d*e2*g2*h2*i*j*l2*m*n3 + &
&96.D0*a*b*d2*e2*g2*h2*i*j*l2*m*n3 + &
&96.D0*b2*c2*e*f*g2*h2*i*j*l2*m*n3 + &
&384.D0*a*b*c*d*e*f*g2*h2*i*j*l2*m*n3 + &
&96.D0*a2*d2*e*f*g2*h2*i*j*l2*m*n3 + &
&96.D0*a*b*c2*f2*g2*h2*i*j*l2*m*n3 + &
&96.D0*a2*c*d*f2*g2*h2*i*j*l2*m*n3 + &
&32.D0*b2*c2*e2*g*h3*i*j*l2*m*n3 + &
&128.D0*a*b*c*d*e2*g*h3*i*j*l2*m*n3 + &
&32.D0*a2*d2*e2*g*h3*i*j*l2*m*n3 + &
&128.D0*a*b*c2*e*f*g*h3*i*j*l2*m*n3 + &
&128.D0*a2*c*d*e*f*g*h3*i*j*l2*m*n3 + &
&32.D0*a2*c2*f2*g*h3*i*j*l2*m*n3 + &
&16.D0*a*b*c2*e2*h4*i*j*l2*m*n3 + &
&16.D0*a2*c*d*e2*h4*i*j*l2*m*n3 + &
&16.D0*a2*c2*e*f*h4*i*j*l2*m*n3 + &
&4.D0*b2*d2*e2*g4*j2*l2*m*n3 + &
&16.D0*b2*c*d*e*f*g4*j2*l2*m*n3 + &
&16.D0*a*b*d2*e*f*g4*j2*l2*m*n3 + &
&4.D0*b2*c2*f2*g4*j2*l2*m*n3 + &
&16.D0*a*b*c*d*f2*g4*j2*l2*m*n3 + &
&4.D0*a2*d2*f2*g4*j2*l2*m*n3 + &
&32.D0*b2*c*d*e2*g3*h*j2*l2*m*n3 + &
&32.D0*a*b*d2*e2*g3*h*j2*l2*m*n3 + &
&32.D0*b2*c2*e*f*g3*h*j2*l2*m*n3 + &
&128.D0*a*b*c*d*e*f*g3*h*j2*l2*m*n3 + &
&32.D0*a2*d2*e*f*g3*h*j2*l2*m*n3 + &
&32.D0*a*b*c2*f2*g3*h*j2*l2*m*n3 + &
&32.D0*a2*c*d*f2*g3*h*j2*l2*m*n3 + &
&24.D0*b2*c2*e2*g2*h2*j2*l2*m*n3 + &
&96.D0*a*b*c*d*e2*g2*h2*j2*l2*m*n3 + &
&24.D0*a2*d2*e2*g2*h2*j2*l2*m*n3 + &
&96.D0*a*b*c2*e*f*g2*h2*j2*l2*m*n3 + &
&96.D0*a2*c*d*e*f*g2*h2*j2*l2*m*n3 + &
&24.D0*a2*c2*f2*g2*h2*j2*l2*m*n3 + &
&32.D0*a*b*c2*e2*g*h3*j2*l2*m*n3 + &
&32.D0*a2*c*d*e2*g*h3*j2*l2*m*n3 + &
&32.D0*a2*c2*e*f*g*h3*j2*l2*m*n3 + &
&4.D0*a2*c2*e2*h4*j2*l2*m*n3 + &
&4.D0*b2*d2*f2*g3*h*i2*k2*n4 + &
&12.D0*b2*d2*e*f*g2*h2*i2*k2*n4 + &
&12.D0*b2*c*d*f2*g2*h2*i2*k2*n4 + &
&12.D0*a*b*d2*f2*g2*h2*i2*k2*n4 + &
&4.D0*b2*d2*e2*g*h3*i2*k2*n4 + &
&16.D0*b2*c*d*e*f*g*h3*i2*k2*n4 + &
&16.D0*a*b*d2*e*f*g*h3*i2*k2*n4 + &
&4.D0*b2*c2*f2*g*h3*i2*k2*n4 + &
&16.D0*a*b*c*d*f2*g*h3*i2*k2*n4 + &
&4.D0*a2*d2*f2*g*h3*i2*k2*n4 + &
&2.D0*b2*c*d*e2*h4*i2*k2*n4 + &
&2.D0*a*b*d2*e2*h4*i2*k2*n4 + &
&2.D0*b2*c2*e*f*h4*i2*k2*n4 + &
&8.D0*a*b*c*d*e*f*h4*i2*k2*n4 + &
&2.D0*a2*d2*e*f*h4*i2*k2*n4 + &
&2.D0*a*b*c2*f2*h4*i2*k2*n4 + &
&2.D0*a2*c*d*f2*h4*i2*k2*n4 + &
&2.D0*b2*d2*f2*g4*i*j*k2*n4 + &
&16.D0*b2*d2*e*f*g3*h*i*j*k2*n4 + &
&16.D0*b2*c*d*f2*g3*h*i*j*k2*n4 + &
&16.D0*a*b*d2*f2*g3*h*i*j*k2*n4 + &
&12.D0*b2*d2*e2*g2*h2*i*j*k2*n4 + &
&48.D0*b2*c*d*e*f*g2*h2*i*j*k2*n4 + &
&48.D0*a*b*d2*e*f*g2*h2*i*j*k2*n4 + &
&12.D0*b2*c2*f2*g2*h2*i*j*k2*n4 + &
&48.D0*a*b*c*d*f2*g2*h2*i*j*k2*n4 + &
&12.D0*a2*d2*f2*g2*h2*i*j*k2*n4 + &
&16.D0*b2*c*d*e2*g*h3*i*j*k2*n4 + &
&16.D0*a*b*d2*e2*g*h3*i*j*k2*n4 + &
&16.D0*b2*c2*e*f*g*h3*i*j*k2*n4 + &
&64.D0*a*b*c*d*e*f*g*h3*i*j*k2*n4 + &
&16.D0*a2*d2*e*f*g*h3*i*j*k2*n4 + &
&16.D0*a*b*c2*f2*g*h3*i*j*k2*n4 + &
&16.D0*a2*c*d*f2*g*h3*i*j*k2*n4 + &
&2.D0*b2*c2*e2*h4*i*j*k2*n4 + &
&8.D0*a*b*c*d*e2*h4*i*j*k2*n4 + &
&2.D0*a2*d2*e2*h4*i*j*k2*n4 + &
&8.D0*a*b*c2*e*f*h4*i*j*k2*n4 + &
&8.D0*a2*c*d*e*f*h4*i*j*k2*n4 + &
&2.D0*a2*c2*f2*h4*i*j*k2*n4 + &
&2.D0*b2*d2*e*f*g4*j2*k2*n4 + &
&2.D0*b2*c*d*f2*g4*j2*k2*n4 + &
&2.D0*a*b*d2*f2*g4*j2*k2*n4 + &
&4.D0*b2*d2*e2*g3*h*j2*k2*n4 + &
&16.D0*b2*c*d*e*f*g3*h*j2*k2*n4 + &
&16.D0*a*b*d2*e*f*g3*h*j2*k2*n4 + &
&4.D0*b2*c2*f2*g3*h*j2*k2*n4 + &
&16.D0*a*b*c*d*f2*g3*h*j2*k2*n4 + &
&4.D0*a2*d2*f2*g3*h*j2*k2*n4 + &
&12.D0*b2*c*d*e2*g2*h2*j2*k2*n4 + &
&12.D0*a*b*d2*e2*g2*h2*j2*k2*n4 + &
&12.D0*b2*c2*e*f*g2*h2*j2*k2*n4 + &
&48.D0*a*b*c*d*e*f*g2*h2*j2*k2*n4 + &
&12.D0*a2*d2*e*f*g2*h2*j2*k2*n4 + &
&12.D0*a*b*c2*f2*g2*h2*j2*k2*n4 + &
&12.D0*a2*c*d*f2*g2*h2*j2*k2*n4 + &
&4.D0*b2*c2*e2*g*h3*j2*k2*n4 + &
&16.D0*a*b*c*d*e2*g*h3*j2*k2*n4 + &
&4.D0*a2*d2*e2*g*h3*j2*k2*n4 + &
&16.D0*a*b*c2*e*f*g*h3*j2*k2*n4 + &
&16.D0*a2*c*d*e*f*g*h3*j2*k2*n4 + &
&4.D0*a2*c2*f2*g*h3*j2*k2*n4 + &
&2.D0*a*b*c2*e2*h4*j2*k2*n4 + &
&2.D0*a2*c*d*e2*h4*j2*k2*n4 + &
&2.D0*a2*c2*e*f*h4*j2*k2*n4 + &
&2.D0*b2*d2*f2*g4*i2*k*l*n4 + &
&16.D0*b2*d2*e*f*g3*h*i2*k*l*n4 + &
&16.D0*b2*c*d*f2*g3*h*i2*k*l*n4 + &
&16.D0*a*b*d2*f2*g3*h*i2*k*l*n4 + &
&12.D0*b2*d2*e2*g2*h2*i2*k*l*n4 + &
&48.D0*b2*c*d*e*f*g2*h2*i2*k*l*n4 + &
&48.D0*a*b*d2*e*f*g2*h2*i2*k*l*n4 + &
&12.D0*b2*c2*f2*g2*h2*i2*k*l*n4 + &
&48.D0*a*b*c*d*f2*g2*h2*i2*k*l*n4 + &
&12.D0*a2*d2*f2*g2*h2*i2*k*l*n4 + &
&16.D0*b2*c*d*e2*g*h3*i2*k*l*n4 + &
&16.D0*a*b*d2*e2*g*h3*i2*k*l*n4 + &
&16.D0*b2*c2*e*f*g*h3*i2*k*l*n4 + &
&64.D0*a*b*c*d*e*f*g*h3*i2*k*l*n4 + &
&16.D0*a2*d2*e*f*g*h3*i2*k*l*n4 + &
&16.D0*a*b*c2*f2*g*h3*i2*k*l*n4 + &
&16.D0*a2*c*d*f2*g*h3*i2*k*l*n4 + &
&2.D0*b2*c2*e2*h4*i2*k*l*n4 + &
&8.D0*a*b*c*d*e2*h4*i2*k*l*n4 + &
&2.D0*a2*d2*e2*h4*i2*k*l*n4 + &
&8.D0*a*b*c2*e*f*h4*i2*k*l*n4 + &
&8.D0*a2*c*d*e*f*h4*i2*k*l*n4 + &
&2.D0*a2*c2*f2*h4*i2*k*l*n4 + &
&8.D0*b2*d2*e*f*g4*i*j*k*l*n4 + &
&8.D0*b2*c*d*f2*g4*i*j*k*l*n4 + &
&8.D0*a*b*d2*f2*g4*i*j*k*l*n4 + &
&16.D0*b2*d2*e2*g3*h*i*j*k*l*n4 + &
&64.D0*b2*c*d*e*f*g3*h*i*j*k*l*n4 + &
&64.D0*a*b*d2*e*f*g3*h*i*j*k*l*n4 + &
&16.D0*b2*c2*f2*g3*h*i*j*k*l*n4 + &
&64.D0*a*b*c*d*f2*g3*h*i*j*k*l*n4 + &
&16.D0*a2*d2*f2*g3*h*i*j*k*l*n4 + &
&48.D0*b2*c*d*e2*g2*h2*i*j*k*l*n4 + &
&48.D0*a*b*d2*e2*g2*h2*i*j*k*l*n4 + &
&48.D0*b2*c2*e*f*g2*h2*i*j*k*l*n4 + &
&192.D0*a*b*c*d*e*f*g2*h2*i*j*k*l*n4 + &
&48.D0*a2*d2*e*f*g2*h2*i*j*k*l*n4 + &
&48.D0*a*b*c2*f2*g2*h2*i*j*k*l*n4 + &
&48.D0*a2*c*d*f2*g2*h2*i*j*k*l*n4 + &
&16.D0*b2*c2*e2*g*h3*i*j*k*l*n4 + &
&64.D0*a*b*c*d*e2*g*h3*i*j*k*l*n4 + &
&16.D0*a2*d2*e2*g*h3*i*j*k*l*n4 + &
&64.D0*a*b*c2*e*f*g*h3*i*j*k*l*n4 + &
&64.D0*a2*c*d*e*f*g*h3*i*j*k*l*n4 + &
&16.D0*a2*c2*f2*g*h3*i*j*k*l*n4 + &
&8.D0*a*b*c2*e2*h4*i*j*k*l*n4 + &
&8.D0*a2*c*d*e2*h4*i*j*k*l*n4 + &
&8.D0*a2*c2*e*f*h4*i*j*k*l*n4 + &
&2.D0*b2*d2*e2*g4*j2*k*l*n4 + &
&8.D0*b2*c*d*e*f*g4*j2*k*l*n4 + &
&8.D0*a*b*d2*e*f*g4*j2*k*l*n4 + &
&2.D0*b2*c2*f2*g4*j2*k*l*n4 + &
&8.D0*a*b*c*d*f2*g4*j2*k*l*n4 + &
&2.D0*a2*d2*f2*g4*j2*k*l*n4 + &
&16.D0*b2*c*d*e2*g3*h*j2*k*l*n4 + &
&16.D0*a*b*d2*e2*g3*h*j2*k*l*n4 + &
&16.D0*b2*c2*e*f*g3*h*j2*k*l*n4 + &
&64.D0*a*b*c*d*e*f*g3*h*j2*k*l*n4 + &
&16.D0*a2*d2*e*f*g3*h*j2*k*l*n4 + &
&16.D0*a*b*c2*f2*g3*h*j2*k*l*n4 + &
&16.D0*a2*c*d*f2*g3*h*j2*k*l*n4 + &
&12.D0*b2*c2*e2*g2*h2*j2*k*l*n4 + &
&48.D0*a*b*c*d*e2*g2*h2*j2*k*l*n4 + &
&12.D0*a2*d2*e2*g2*h2*j2*k*l*n4 + &
&48.D0*a*b*c2*e*f*g2*h2*j2*k*l*n4 + &
&48.D0*a2*c*d*e*f*g2*h2*j2*k*l*n4 + &
&12.D0*a2*c2*f2*g2*h2*j2*k*l*n4 + &
&16.D0*a*b*c2*e2*g*h3*j2*k*l*n4 + &
&16.D0*a2*c*d*e2*g*h3*j2*k*l*n4 + &
&16.D0*a2*c2*e*f*g*h3*j2*k*l*n4 + &
&2.D0*a2*c2*e2*h4*j2*k*l*n4 + &
&2.D0*b2*d2*e*f*g4*i2*l2*n4 + &
&2.D0*b2*c*d*f2*g4*i2*l2*n4 + &
&2.D0*a*b*d2*f2*g4*i2*l2*n4 + &
&4.D0*b2*d2*e2*g3*h*i2*l2*n4 + &
&16.D0*b2*c*d*e*f*g3*h*i2*l2*n4 + &
&16.D0*a*b*d2*e*f*g3*h*i2*l2*n4 + &
&4.D0*b2*c2*f2*g3*h*i2*l2*n4 + &
&16.D0*a*b*c*d*f2*g3*h*i2*l2*n4 + &
&4.D0*a2*d2*f2*g3*h*i2*l2*n4 + &
&12.D0*b2*c*d*e2*g2*h2*i2*l2*n4 + &
&12.D0*a*b*d2*e2*g2*h2*i2*l2*n4 + &
&12.D0*b2*c2*e*f*g2*h2*i2*l2*n4 + &
&48.D0*a*b*c*d*e*f*g2*h2*i2*l2*n4 + &
&12.D0*a2*d2*e*f*g2*h2*i2*l2*n4 + &
&12.D0*a*b*c2*f2*g2*h2*i2*l2*n4 + &
&12.D0*a2*c*d*f2*g2*h2*i2*l2*n4 + &
&4.D0*b2*c2*e2*g*h3*i2*l2*n4 + &
&16.D0*a*b*c*d*e2*g*h3*i2*l2*n4 + &
&4.D0*a2*d2*e2*g*h3*i2*l2*n4 + &
&16.D0*a*b*c2*e*f*g*h3*i2*l2*n4 + &
&16.D0*a2*c*d*e*f*g*h3*i2*l2*n4 + &
&4.D0*a2*c2*f2*g*h3*i2*l2*n4 + &
&2.D0*a*b*c2*e2*h4*i2*l2*n4 + &
&2.D0*a2*c*d*e2*h4*i2*l2*n4 + &
&2.D0*a2*c2*e*f*h4*i2*l2*n4 + &
&2.D0*b2*d2*e2*g4*i*j*l2*n4 + &
&8.D0*b2*c*d*e*f*g4*i*j*l2*n4 + &
&8.D0*a*b*d2*e*f*g4*i*j*l2*n4 + &
&2.D0*b2*c2*f2*g4*i*j*l2*n4 + &
&8.D0*a*b*c*d*f2*g4*i*j*l2*n4 + &
&2.D0*a2*d2*f2*g4*i*j*l2*n4 + &
&16.D0*b2*c*d*e2*g3*h*i*j*l2*n4 + &
&16.D0*a*b*d2*e2*g3*h*i*j*l2*n4 + &
&16.D0*b2*c2*e*f*g3*h*i*j*l2*n4 + &
&64.D0*a*b*c*d*e*f*g3*h*i*j*l2*n4 + &
&16.D0*a2*d2*e*f*g3*h*i*j*l2*n4 + &
&16.D0*a*b*c2*f2*g3*h*i*j*l2*n4 + &
&16.D0*a2*c*d*f2*g3*h*i*j*l2*n4 + &
&12.D0*b2*c2*e2*g2*h2*i*j*l2*n4 + &
&48.D0*a*b*c*d*e2*g2*h2*i*j*l2*n4 + &
&12.D0*a2*d2*e2*g2*h2*i*j*l2*n4 + &
&48.D0*a*b*c2*e*f*g2*h2*i*j*l2*n4 + &
&48.D0*a2*c*d*e*f*g2*h2*i*j*l2*n4 + &
&12.D0*a2*c2*f2*g2*h2*i*j*l2*n4 + &
&16.D0*a*b*c2*e2*g*h3*i*j*l2*n4 + &
&16.D0*a2*c*d*e2*g*h3*i*j*l2*n4 + &
&16.D0*a2*c2*e*f*g*h3*i*j*l2*n4 + &
&2.D0*a2*c2*e2*h4*i*j*l2*n4 + &
&2.D0*b2*c*d*e2*g4*j2*l2*n4 + &
&2.D0*a*b*d2*e2*g4*j2*l2*n4 + &
&2.D0*b2*c2*e*f*g4*j2*l2*n4 + &
&8.D0*a*b*c*d*e*f*g4*j2*l2*n4 + &
&2.D0*a2*d2*e*f*g4*j2*l2*n4 + &
&2.D0*a*b*c2*f2*g4*j2*l2*n4 + &
&2.D0*a2*c*d*f2*g4*j2*l2*n4 + &
&4.D0*b2*c2*e2*g3*h*j2*l2*n4 + &
&16.D0*a*b*c*d*e2*g3*h*j2*l2*n4 + &
&4.D0*a2*d2*e2*g3*h*j2*l2*n4 + &
&16.D0*a*b*c2*e*f*g3*h*j2*l2*n4 + &
&16.D0*a2*c*d*e*f*g3*h*j2*l2*n4 + &
&4.D0*a2*c2*f2*g3*h*j2*l2*n4 + &
&12.D0*a*b*c2*e2*g2*h2*j2*l2*n4 + &
&12.D0*a2*c*d*e2*g2*h2*j2*l2*n4 + &
&12.D0*a2*c2*e*f*g2*h2*j2*l2*n4 + &
&4.D0*a2*c2*e2*g*h3*j2*l2*n4

IONIZ_PROBA(12)=b2*d2*f2*h4*j2*k2*m4 + &
&4.D0*b2*d2*f2*h4*i*j*k*l*m4 + &
&8.D0*b2*d2*f2*g*h3*j2*k*l*m4 + &
&4.D0*b2*d2*e*f*h4*j2*k*l*m4 + &
&4.D0*b2*c*d*f2*h4*j2*k*l*m4 + &
&4.D0*a*b*d2*f2*h4*j2*k*l*m4 + &
&b2*d2*f2*h4*i2*l2*m4 + &
&8.D0*b2*d2*f2*g*h3*i*j*l2*m4 + &
&4.D0*b2*d2*e*f*h4*i*j*l2*m4 + &
&4.D0*b2*c*d*f2*h4*i*j*l2*m4 + &
&4.D0*a*b*d2*f2*h4*i*j*l2*m4 + &
&6.D0*b2*d2*f2*g2*h2*j2*l2*m4 + &
&8.D0*b2*d2*e*f*g*h3*j2*l2*m4 + &
&8.D0*b2*c*d*f2*g*h3*j2*l2*m4 + &
&8.D0*a*b*d2*f2*g*h3*j2*l2*m4 + &
&b2*d2*e2*h4*j2*l2*m4 + &
&4.D0*b2*c*d*e*f*h4*j2*l2*m4 + &
&4.D0*a*b*d2*e*f*h4*j2*l2*m4 + &
&b2*c2*f2*h4*j2*l2*m4 + &
&4.D0*a*b*c*d*f2*h4*j2*l2*m4 + &
&a2*d2*f2*h4*j2*l2*m4 + &
&8.D0*b2*d2*f2*h4*i*j*k2*m3*n + &
&16.D0*b2*d2*f2*g*h3*j2*k2*m3*n + &
&8.D0*b2*d2*e*f*h4*j2*k2*m3*n + &
&8.D0*b2*c*d*f2*h4*j2*k2*m3*n + &
&8.D0*a*b*d2*f2*h4*j2*k2*m3*n + &
&8.D0*b2*d2*f2*h4*i2*k*l*m3*n + &
&64.D0*b2*d2*f2*g*h3*i*j*k*l*m3*n + &
&32.D0*b2*d2*e*f*h4*i*j*k*l*m3*n + &
&32.D0*b2*c*d*f2*h4*i*j*k*l*m3*n + &
&32.D0*a*b*d2*f2*h4*i*j*k*l*m3*n + &
&48.D0*b2*d2*f2*g2*h2*j2*k*l*m3*n + &
&64.D0*b2*d2*e*f*g*h3*j2*k*l*m3*n + &
&64.D0*b2*c*d*f2*g*h3*j2*k*l*m3*n + &
&64.D0*a*b*d2*f2*g*h3*j2*k*l*m3*n + &
&8.D0*b2*d2*e2*h4*j2*k*l*m3*n + &
&32.D0*b2*c*d*e*f*h4*j2*k*l*m3*n + &
&32.D0*a*b*d2*e*f*h4*j2*k*l*m3*n + &
&8.D0*b2*c2*f2*h4*j2*k*l*m3*n + &
&32.D0*a*b*c*d*f2*h4*j2*k*l*m3*n + &
&8.D0*a2*d2*f2*h4*j2*k*l*m3*n + &
&16.D0*b2*d2*f2*g*h3*i2*l2*m3*n + &
&8.D0*b2*d2*e*f*h4*i2*l2*m3*n + &
&8.D0*b2*c*d*f2*h4*i2*l2*m3*n + &
&8.D0*a*b*d2*f2*h4*i2*l2*m3*n + &
&48.D0*b2*d2*f2*g2*h2*i*j*l2*m3*n + &
&64.D0*b2*d2*e*f*g*h3*i*j*l2*m3*n + &
&64.D0*b2*c*d*f2*g*h3*i*j*l2*m3*n + &
&64.D0*a*b*d2*f2*g*h3*i*j*l2*m3*n + &
&8.D0*b2*d2*e2*h4*i*j*l2*m3*n + &
&32.D0*b2*c*d*e*f*h4*i*j*l2*m3*n + &
&32.D0*a*b*d2*e*f*h4*i*j*l2*m3*n + &
&8.D0*b2*c2*f2*h4*i*j*l2*m3*n + &
&32.D0*a*b*c*d*f2*h4*i*j*l2*m3*n + &
&8.D0*a2*d2*f2*h4*i*j*l2*m3*n + &
&16.D0*b2*d2*f2*g3*h*j2*l2*m3*n + &
&48.D0*b2*d2*e*f*g2*h2*j2*l2*m3*n + &
&48.D0*b2*c*d*f2*g2*h2*j2*l2*m3*n + &
&48.D0*a*b*d2*f2*g2*h2*j2*l2*m3*n + &
&16.D0*b2*d2*e2*g*h3*j2*l2*m3*n + &
&64.D0*b2*c*d*e*f*g*h3*j2*l2*m3*n + &
&64.D0*a*b*d2*e*f*g*h3*j2*l2*m3*n + &
&16.D0*b2*c2*f2*g*h3*j2*l2*m3*n + &
&64.D0*a*b*c*d*f2*g*h3*j2*l2*m3*n + &
&16.D0*a2*d2*f2*g*h3*j2*l2*m3*n + &
&8.D0*b2*c*d*e2*h4*j2*l2*m3*n + &
&8.D0*a*b*d2*e2*h4*j2*l2*m3*n + &
&8.D0*b2*c2*e*f*h4*j2*l2*m3*n + &
&32.D0*a*b*c*d*e*f*h4*j2*l2*m3*n + &
&8.D0*a2*d2*e*f*h4*j2*l2*m3*n + &
&8.D0*a*b*c2*f2*h4*j2*l2*m3*n + &
&8.D0*a2*c*d*f2*h4*j2*l2*m3*n + &
&6.D0*b2*d2*f2*h4*i2*k2*m2*n2 + &
&48.D0*b2*d2*f2*g*h3*i*j*k2*m2*n2 + &
&24.D0*b2*d2*e*f*h4*i*j*k2*m2*n2 + &
&24.D0*b2*c*d*f2*h4*i*j*k2*m2*n2 + &
&24.D0*a*b*d2*f2*h4*i*j*k2*m2*n2 + &
&36.D0*b2*d2*f2*g2*h2*j2*k2*m2*n2 + &
&48.D0*b2*d2*e*f*g*h3*j2*k2*m2*n2 + &
&48.D0*b2*c*d*f2*g*h3*j2*k2*m2*n2 + &
&48.D0*a*b*d2*f2*g*h3*j2*k2*m2*n2 + &
&6.D0*b2*d2*e2*h4*j2*k2*m2*n2 + &
&24.D0*b2*c*d*e*f*h4*j2*k2*m2*n2 + &
&24.D0*a*b*d2*e*f*h4*j2*k2*m2*n2 + &
&6.D0*b2*c2*f2*h4*j2*k2*m2*n2 + &
&24.D0*a*b*c*d*f2*h4*j2*k2*m2*n2 + &
&6.D0*a2*d2*f2*h4*j2*k2*m2*n2 + &
&48.D0*b2*d2*f2*g*h3*i2*k*l*m2*n2 + &
&24.D0*b2*d2*e*f*h4*i2*k*l*m2*n2 + &
&24.D0*b2*c*d*f2*h4*i2*k*l*m2*n2 + &
&24.D0*a*b*d2*f2*h4*i2*k*l*m2*n2 + &
&144.D0*b2*d2*f2*g2*h2*i*j*k*l*m2*n2 + &
&192.D0*b2*d2*e*f*g*h3*i*j*k*l*m2*n2 + &
&192.D0*b2*c*d*f2*g*h3*i*j*k*l*m2*n2 + &
&192.D0*a*b*d2*f2*g*h3*i*j*k*l*m2*n2 + &
&24.D0*b2*d2*e2*h4*i*j*k*l*m2*n2 + &
&96.D0*b2*c*d*e*f*h4*i*j*k*l*m2*n2 + &
&96.D0*a*b*d2*e*f*h4*i*j*k*l*m2*n2 + &
&24.D0*b2*c2*f2*h4*i*j*k*l*m2*n2 + &
&96.D0*a*b*c*d*f2*h4*i*j*k*l*m2*n2 + &
&24.D0*a2*d2*f2*h4*i*j*k*l*m2*n2 + &
&48.D0*b2*d2*f2*g3*h*j2*k*l*m2*n2 + &
&144.D0*b2*d2*e*f*g2*h2*j2*k*l*m2*n2 + &
&144.D0*b2*c*d*f2*g2*h2*j2*k*l*m2*n2 + &
&144.D0*a*b*d2*f2*g2*h2*j2*k*l*m2*n2 + &
&48.D0*b2*d2*e2*g*h3*j2*k*l*m2*n2 + &
&192.D0*b2*c*d*e*f*g*h3*j2*k*l*m2*n2 + &
&192.D0*a*b*d2*e*f*g*h3*j2*k*l*m2*n2 + &
&48.D0*b2*c2*f2*g*h3*j2*k*l*m2*n2 + &
&192.D0*a*b*c*d*f2*g*h3*j2*k*l*m2*n2 + &
&48.D0*a2*d2*f2*g*h3*j2*k*l*m2*n2 + &
&24.D0*b2*c*d*e2*h4*j2*k*l*m2*n2 + &
&24.D0*a*b*d2*e2*h4*j2*k*l*m2*n2 + &
&24.D0*b2*c2*e*f*h4*j2*k*l*m2*n2 + &
&96.D0*a*b*c*d*e*f*h4*j2*k*l*m2*n2 + &
&24.D0*a2*d2*e*f*h4*j2*k*l*m2*n2 + &
&24.D0*a*b*c2*f2*h4*j2*k*l*m2*n2 + &
&24.D0*a2*c*d*f2*h4*j2*k*l*m2*n2 + &
&36.D0*b2*d2*f2*g2*h2*i2*l2*m2*n2 + &
&48.D0*b2*d2*e*f*g*h3*i2*l2*m2*n2 + &
&48.D0*b2*c*d*f2*g*h3*i2*l2*m2*n2 + &
&48.D0*a*b*d2*f2*g*h3*i2*l2*m2*n2 + &
&6.D0*b2*d2*e2*h4*i2*l2*m2*n2 + &
&24.D0*b2*c*d*e*f*h4*i2*l2*m2*n2 + &
&24.D0*a*b*d2*e*f*h4*i2*l2*m2*n2 + &
&6.D0*b2*c2*f2*h4*i2*l2*m2*n2 + &
&24.D0*a*b*c*d*f2*h4*i2*l2*m2*n2 + &
&6.D0*a2*d2*f2*h4*i2*l2*m2*n2 + &
&48.D0*b2*d2*f2*g3*h*i*j*l2*m2*n2 + &
&144.D0*b2*d2*e*f*g2*h2*i*j*l2*m2*n2 + &
&144.D0*b2*c*d*f2*g2*h2*i*j*l2*m2*n2 + &
&144.D0*a*b*d2*f2*g2*h2*i*j*l2*m2*n2 + &
&48.D0*b2*d2*e2*g*h3*i*j*l2*m2*n2 + &
&192.D0*b2*c*d*e*f*g*h3*i*j*l2*m2*n2 + &
&192.D0*a*b*d2*e*f*g*h3*i*j*l2*m2*n2 + &
&48.D0*b2*c2*f2*g*h3*i*j*l2*m2*n2 + &
&192.D0*a*b*c*d*f2*g*h3*i*j*l2*m2*n2 + &
&48.D0*a2*d2*f2*g*h3*i*j*l2*m2*n2 + &
&24.D0*b2*c*d*e2*h4*i*j*l2*m2*n2 + &
&24.D0*a*b*d2*e2*h4*i*j*l2*m2*n2 + &
&24.D0*b2*c2*e*f*h4*i*j*l2*m2*n2 + &
&96.D0*a*b*c*d*e*f*h4*i*j*l2*m2*n2 + &
&24.D0*a2*d2*e*f*h4*i*j*l2*m2*n2 + &
&24.D0*a*b*c2*f2*h4*i*j*l2*m2*n2 + &
&24.D0*a2*c*d*f2*h4*i*j*l2*m2*n2 + &
&6.D0*b2*d2*f2*g4*j2*l2*m2*n2 + &
&48.D0*b2*d2*e*f*g3*h*j2*l2*m2*n2 + &
&48.D0*b2*c*d*f2*g3*h*j2*l2*m2*n2 + &
&48.D0*a*b*d2*f2*g3*h*j2*l2*m2*n2 + &
&36.D0*b2*d2*e2*g2*h2*j2*l2*m2*n2 + &
&144.D0*b2*c*d*e*f*g2*h2*j2*l2*m2*n2 + &
&144.D0*a*b*d2*e*f*g2*h2*j2*l2*m2*n2 + &
&36.D0*b2*c2*f2*g2*h2*j2*l2*m2*n2 + &
&144.D0*a*b*c*d*f2*g2*h2*j2*l2*m2*n2 + &
&36.D0*a2*d2*f2*g2*h2*j2*l2*m2*n2 + &
&48.D0*b2*c*d*e2*g*h3*j2*l2*m2*n2 + &
&48.D0*a*b*d2*e2*g*h3*j2*l2*m2*n2 + &
&48.D0*b2*c2*e*f*g*h3*j2*l2*m2*n2 + &
&192.D0*a*b*c*d*e*f*g*h3*j2*l2*m2*n2 + &
&48.D0*a2*d2*e*f*g*h3*j2*l2*m2*n2 + &
&48.D0*a*b*c2*f2*g*h3*j2*l2*m2*n2 + &
&48.D0*a2*c*d*f2*g*h3*j2*l2*m2*n2 + &
&6.D0*b2*c2*e2*h4*j2*l2*m2*n2 + &
&24.D0*a*b*c*d*e2*h4*j2*l2*m2*n2 + &
&6.D0*a2*d2*e2*h4*j2*l2*m2*n2 + &
&24.D0*a*b*c2*e*f*h4*j2*l2*m2*n2 + &
&24.D0*a2*c*d*e*f*h4*j2*l2*m2*n2 + &
&6.D0*a2*c2*f2*h4*j2*l2*m2*n2 + &
&16.D0*b2*d2*f2*g*h3*i2*k2*m*n3 + &
&8.D0*b2*d2*e*f*h4*i2*k2*m*n3 + &
&8.D0*b2*c*d*f2*h4*i2*k2*m*n3 + &
&8.D0*a*b*d2*f2*h4*i2*k2*m*n3 + &
&48.D0*b2*d2*f2*g2*h2*i*j*k2*m*n3 + &
&64.D0*b2*d2*e*f*g*h3*i*j*k2*m*n3 + &
&64.D0*b2*c*d*f2*g*h3*i*j*k2*m*n3 + &
&64.D0*a*b*d2*f2*g*h3*i*j*k2*m*n3 + &
&8.D0*b2*d2*e2*h4*i*j*k2*m*n3 + &
&32.D0*b2*c*d*e*f*h4*i*j*k2*m*n3 + &
&32.D0*a*b*d2*e*f*h4*i*j*k2*m*n3 + &
&8.D0*b2*c2*f2*h4*i*j*k2*m*n3 + &
&32.D0*a*b*c*d*f2*h4*i*j*k2*m*n3 + &
&8.D0*a2*d2*f2*h4*i*j*k2*m*n3 + &
&16.D0*b2*d2*f2*g3*h*j2*k2*m*n3 + &
&48.D0*b2*d2*e*f*g2*h2*j2*k2*m*n3 + &
&48.D0*b2*c*d*f2*g2*h2*j2*k2*m*n3 + &
&48.D0*a*b*d2*f2*g2*h2*j2*k2*m*n3 + &
&16.D0*b2*d2*e2*g*h3*j2*k2*m*n3 + &
&64.D0*b2*c*d*e*f*g*h3*j2*k2*m*n3 + &
&64.D0*a*b*d2*e*f*g*h3*j2*k2*m*n3 + &
&16.D0*b2*c2*f2*g*h3*j2*k2*m*n3 + &
&64.D0*a*b*c*d*f2*g*h3*j2*k2*m*n3 + &
&16.D0*a2*d2*f2*g*h3*j2*k2*m*n3 + &
&8.D0*b2*c*d*e2*h4*j2*k2*m*n3 + &
&8.D0*a*b*d2*e2*h4*j2*k2*m*n3 + &
&8.D0*b2*c2*e*f*h4*j2*k2*m*n3 + &
&32.D0*a*b*c*d*e*f*h4*j2*k2*m*n3 + &
&8.D0*a2*d2*e*f*h4*j2*k2*m*n3 + &
&8.D0*a*b*c2*f2*h4*j2*k2*m*n3 + &
&8.D0*a2*c*d*f2*h4*j2*k2*m*n3 + &
&48.D0*b2*d2*f2*g2*h2*i2*k*l*m*n3 + &
&64.D0*b2*d2*e*f*g*h3*i2*k*l*m*n3 + &
&64.D0*b2*c*d*f2*g*h3*i2*k*l*m*n3 + &
&64.D0*a*b*d2*f2*g*h3*i2*k*l*m*n3 + &
&8.D0*b2*d2*e2*h4*i2*k*l*m*n3 + &
&32.D0*b2*c*d*e*f*h4*i2*k*l*m*n3 + &
&32.D0*a*b*d2*e*f*h4*i2*k*l*m*n3 + &
&8.D0*b2*c2*f2*h4*i2*k*l*m*n3 + &
&32.D0*a*b*c*d*f2*h4*i2*k*l*m*n3 + &
&8.D0*a2*d2*f2*h4*i2*k*l*m*n3 + &
&64.D0*b2*d2*f2*g3*h*i*j*k*l*m*n3 + &
&192.D0*b2*d2*e*f*g2*h2*i*j*k*l*m*n3 + &
&192.D0*b2*c*d*f2*g2*h2*i*j*k*l*m*n3 + &
&192.D0*a*b*d2*f2*g2*h2*i*j*k*l*m*n3 + &
&64.D0*b2*d2*e2*g*h3*i*j*k*l*m*n3 + &
&256.D0*b2*c*d*e*f*g*h3*i*j*k*l*m*n3 + &
&256.D0*a*b*d2*e*f*g*h3*i*j*k*l*m*n3 + &
&64.D0*b2*c2*f2*g*h3*i*j*k*l*m*n3 + &
&256.D0*a*b*c*d*f2*g*h3*i*j*k*l*m*n3 + &
&64.D0*a2*d2*f2*g*h3*i*j*k*l*m*n3 + &
&32.D0*b2*c*d*e2*h4*i*j*k*l*m*n3 + &
&32.D0*a*b*d2*e2*h4*i*j*k*l*m*n3 + &
&32.D0*b2*c2*e*f*h4*i*j*k*l*m*n3 + &
&128.D0*a*b*c*d*e*f*h4*i*j*k*l*m*n3 + &
&32.D0*a2*d2*e*f*h4*i*j*k*l*m*n3 + &
&32.D0*a*b*c2*f2*h4*i*j*k*l*m*n3 + &
&32.D0*a2*c*d*f2*h4*i*j*k*l*m*n3 + &
&8.D0*b2*d2*f2*g4*j2*k*l*m*n3 + &
&64.D0*b2*d2*e*f*g3*h*j2*k*l*m*n3 + &
&64.D0*b2*c*d*f2*g3*h*j2*k*l*m*n3 + &
&64.D0*a*b*d2*f2*g3*h*j2*k*l*m*n3 + &
&48.D0*b2*d2*e2*g2*h2*j2*k*l*m*n3 + &
&192.D0*b2*c*d*e*f*g2*h2*j2*k*l*m*n3 + &
&192.D0*a*b*d2*e*f*g2*h2*j2*k*l*m*n3 + &
&48.D0*b2*c2*f2*g2*h2*j2*k*l*m*n3 + &
&192.D0*a*b*c*d*f2*g2*h2*j2*k*l*m*n3 + &
&48.D0*a2*d2*f2*g2*h2*j2*k*l*m*n3 + &
&64.D0*b2*c*d*e2*g*h3*j2*k*l*m*n3 + &
&64.D0*a*b*d2*e2*g*h3*j2*k*l*m*n3 + &
&64.D0*b2*c2*e*f*g*h3*j2*k*l*m*n3 + &
&256.D0*a*b*c*d*e*f*g*h3*j2*k*l*m*n3 + &
&64.D0*a2*d2*e*f*g*h3*j2*k*l*m*n3 + &
&64.D0*a*b*c2*f2*g*h3*j2*k*l*m*n3 + &
&64.D0*a2*c*d*f2*g*h3*j2*k*l*m*n3 + &
&8.D0*b2*c2*e2*h4*j2*k*l*m*n3 + &
&32.D0*a*b*c*d*e2*h4*j2*k*l*m*n3 + &
&8.D0*a2*d2*e2*h4*j2*k*l*m*n3 + &
&32.D0*a*b*c2*e*f*h4*j2*k*l*m*n3 + &
&32.D0*a2*c*d*e*f*h4*j2*k*l*m*n3 + &
&8.D0*a2*c2*f2*h4*j2*k*l*m*n3 + &
&16.D0*b2*d2*f2*g3*h*i2*l2*m*n3 + &
&48.D0*b2*d2*e*f*g2*h2*i2*l2*m*n3 + &
&48.D0*b2*c*d*f2*g2*h2*i2*l2*m*n3 + &
&48.D0*a*b*d2*f2*g2*h2*i2*l2*m*n3 + &
&16.D0*b2*d2*e2*g*h3*i2*l2*m*n3 + &
&64.D0*b2*c*d*e*f*g*h3*i2*l2*m*n3 + &
&64.D0*a*b*d2*e*f*g*h3*i2*l2*m*n3 + &
&16.D0*b2*c2*f2*g*h3*i2*l2*m*n3 + &
&64.D0*a*b*c*d*f2*g*h3*i2*l2*m*n3 + &
&16.D0*a2*d2*f2*g*h3*i2*l2*m*n3 + &
&8.D0*b2*c*d*e2*h4*i2*l2*m*n3 + &
&8.D0*a*b*d2*e2*h4*i2*l2*m*n3 + &
&8.D0*b2*c2*e*f*h4*i2*l2*m*n3 + &
&32.D0*a*b*c*d*e*f*h4*i2*l2*m*n3 + &
&8.D0*a2*d2*e*f*h4*i2*l2*m*n3 + &
&8.D0*a*b*c2*f2*h4*i2*l2*m*n3 + &
&8.D0*a2*c*d*f2*h4*i2*l2*m*n3 + &
&8.D0*b2*d2*f2*g4*i*j*l2*m*n3 + &
&64.D0*b2*d2*e*f*g3*h*i*j*l2*m*n3 + &
&64.D0*b2*c*d*f2*g3*h*i*j*l2*m*n3 + &
&64.D0*a*b*d2*f2*g3*h*i*j*l2*m*n3 + &
&48.D0*b2*d2*e2*g2*h2*i*j*l2*m*n3 + &
&192.D0*b2*c*d*e*f*g2*h2*i*j*l2*m*n3 + &
&192.D0*a*b*d2*e*f*g2*h2*i*j*l2*m*n3 + &
&48.D0*b2*c2*f2*g2*h2*i*j*l2*m*n3 + &
&192.D0*a*b*c*d*f2*g2*h2*i*j*l2*m*n3 + &
&48.D0*a2*d2*f2*g2*h2*i*j*l2*m*n3 + &
&64.D0*b2*c*d*e2*g*h3*i*j*l2*m*n3 + &
&64.D0*a*b*d2*e2*g*h3*i*j*l2*m*n3 + &
&64.D0*b2*c2*e*f*g*h3*i*j*l2*m*n3 + &
&256.D0*a*b*c*d*e*f*g*h3*i*j*l2*m*n3 + &
&64.D0*a2*d2*e*f*g*h3*i*j*l2*m*n3 + &
&64.D0*a*b*c2*f2*g*h3*i*j*l2*m*n3 + &
&64.D0*a2*c*d*f2*g*h3*i*j*l2*m*n3 + &
&8.D0*b2*c2*e2*h4*i*j*l2*m*n3 + &
&32.D0*a*b*c*d*e2*h4*i*j*l2*m*n3 + &
&8.D0*a2*d2*e2*h4*i*j*l2*m*n3 + &
&32.D0*a*b*c2*e*f*h4*i*j*l2*m*n3 + &
&32.D0*a2*c*d*e*f*h4*i*j*l2*m*n3 + &
&8.D0*a2*c2*f2*h4*i*j*l2*m*n3 + &
&8.D0*b2*d2*e*f*g4*j2*l2*m*n3 + &
&8.D0*b2*c*d*f2*g4*j2*l2*m*n3 + &
&8.D0*a*b*d2*f2*g4*j2*l2*m*n3 + &
&16.D0*b2*d2*e2*g3*h*j2*l2*m*n3 + &
&64.D0*b2*c*d*e*f*g3*h*j2*l2*m*n3 + &
&64.D0*a*b*d2*e*f*g3*h*j2*l2*m*n3 + &
&16.D0*b2*c2*f2*g3*h*j2*l2*m*n3 + &
&64.D0*a*b*c*d*f2*g3*h*j2*l2*m*n3 + &
&16.D0*a2*d2*f2*g3*h*j2*l2*m*n3 + &
&48.D0*b2*c*d*e2*g2*h2*j2*l2*m*n3 + &
&48.D0*a*b*d2*e2*g2*h2*j2*l2*m*n3 + &
&48.D0*b2*c2*e*f*g2*h2*j2*l2*m*n3 + &
&192.D0*a*b*c*d*e*f*g2*h2*j2*l2*m*n3 + &
&48.D0*a2*d2*e*f*g2*h2*j2*l2*m*n3 + &
&48.D0*a*b*c2*f2*g2*h2*j2*l2*m*n3 + &
&48.D0*a2*c*d*f2*g2*h2*j2*l2*m*n3 + &
&16.D0*b2*c2*e2*g*h3*j2*l2*m*n3 + &
&64.D0*a*b*c*d*e2*g*h3*j2*l2*m*n3 + &
&16.D0*a2*d2*e2*g*h3*j2*l2*m*n3 + &
&64.D0*a*b*c2*e*f*g*h3*j2*l2*m*n3 + &
&64.D0*a2*c*d*e*f*g*h3*j2*l2*m*n3 + &
&16.D0*a2*c2*f2*g*h3*j2*l2*m*n3 + &
&8.D0*a*b*c2*e2*h4*j2*l2*m*n3 + &
&8.D0*a2*c*d*e2*h4*j2*l2*m*n3 + &
&8.D0*a2*c2*e*f*h4*j2*l2*m*n3 + &
&6.D0*b2*d2*f2*g2*h2*i2*k2*n4 + &
&8.D0*b2*d2*e*f*g*h3*i2*k2*n4 + &
&8.D0*b2*c*d*f2*g*h3*i2*k2*n4 + &
&8.D0*a*b*d2*f2*g*h3*i2*k2*n4 + &
&b2*d2*e2*h4*i2*k2*n4 + &
&4.D0*b2*c*d*e*f*h4*i2*k2*n4 + &
&4.D0*a*b*d2*e*f*h4*i2*k2*n4 + &
&b2*c2*f2*h4*i2*k2*n4 + &
&4.D0*a*b*c*d*f2*h4*i2*k2*n4 + &
&a2*d2*f2*h4*i2*k2*n4 + &
&8.D0*b2*d2*f2*g3*h*i*j*k2*n4 + &
&24.D0*b2*d2*e*f*g2*h2*i*j*k2*n4 + &
&24.D0*b2*c*d*f2*g2*h2*i*j*k2*n4 + &
&24.D0*a*b*d2*f2*g2*h2*i*j*k2*n4 + &
&8.D0*b2*d2*e2*g*h3*i*j*k2*n4 + &
&32.D0*b2*c*d*e*f*g*h3*i*j*k2*n4 + &
&32.D0*a*b*d2*e*f*g*h3*i*j*k2*n4 + &
&8.D0*b2*c2*f2*g*h3*i*j*k2*n4 + &
&32.D0*a*b*c*d*f2*g*h3*i*j*k2*n4 + &
&8.D0*a2*d2*f2*g*h3*i*j*k2*n4 + &
&4.D0*b2*c*d*e2*h4*i*j*k2*n4 + &
&4.D0*a*b*d2*e2*h4*i*j*k2*n4 + &
&4.D0*b2*c2*e*f*h4*i*j*k2*n4 + &
&16.D0*a*b*c*d*e*f*h4*i*j*k2*n4 + &
&4.D0*a2*d2*e*f*h4*i*j*k2*n4 + &
&4.D0*a*b*c2*f2*h4*i*j*k2*n4 + &
&4.D0*a2*c*d*f2*h4*i*j*k2*n4 + &
&b2*d2*f2*g4*j2*k2*n4 + &
&8.D0*b2*d2*e*f*g3*h*j2*k2*n4 + &
&8.D0*b2*c*d*f2*g3*h*j2*k2*n4 + &
&8.D0*a*b*d2*f2*g3*h*j2*k2*n4 + &
&6.D0*b2*d2*e2*g2*h2*j2*k2*n4 + &
&24.D0*b2*c*d*e*f*g2*h2*j2*k2*n4 + &
&24.D0*a*b*d2*e*f*g2*h2*j2*k2*n4 + &
&6.D0*b2*c2*f2*g2*h2*j2*k2*n4 + &
&24.D0*a*b*c*d*f2*g2*h2*j2*k2*n4 + &
&6.D0*a2*d2*f2*g2*h2*j2*k2*n4 + &
&8.D0*b2*c*d*e2*g*h3*j2*k2*n4 + &
&8.D0*a*b*d2*e2*g*h3*j2*k2*n4 + &
&8.D0*b2*c2*e*f*g*h3*j2*k2*n4 + &
&32.D0*a*b*c*d*e*f*g*h3*j2*k2*n4 + &
&8.D0*a2*d2*e*f*g*h3*j2*k2*n4 + &
&8.D0*a*b*c2*f2*g*h3*j2*k2*n4 + &
&8.D0*a2*c*d*f2*g*h3*j2*k2*n4 + &
&b2*c2*e2*h4*j2*k2*n4 + &
&4.D0*a*b*c*d*e2*h4*j2*k2*n4 + &
&a2*d2*e2*h4*j2*k2*n4 + &
&4.D0*a*b*c2*e*f*h4*j2*k2*n4 + &
&4.D0*a2*c*d*e*f*h4*j2*k2*n4 + &
&a2*c2*f2*h4*j2*k2*n4 + &
&8.D0*b2*d2*f2*g3*h*i2*k*l*n4 + &
&24.D0*b2*d2*e*f*g2*h2*i2*k*l*n4 + &
&24.D0*b2*c*d*f2*g2*h2*i2*k*l*n4 + &
&24.D0*a*b*d2*f2*g2*h2*i2*k*l*n4 + &
&8.D0*b2*d2*e2*g*h3*i2*k*l*n4 + &
&32.D0*b2*c*d*e*f*g*h3*i2*k*l*n4 + &
&32.D0*a*b*d2*e*f*g*h3*i2*k*l*n4 + &
&8.D0*b2*c2*f2*g*h3*i2*k*l*n4 + &
&32.D0*a*b*c*d*f2*g*h3*i2*k*l*n4 + &
&8.D0*a2*d2*f2*g*h3*i2*k*l*n4 + &
&4.D0*b2*c*d*e2*h4*i2*k*l*n4 + &
&4.D0*a*b*d2*e2*h4*i2*k*l*n4 + &
&4.D0*b2*c2*e*f*h4*i2*k*l*n4 + &
&16.D0*a*b*c*d*e*f*h4*i2*k*l*n4 + &
&4.D0*a2*d2*e*f*h4*i2*k*l*n4 + &
&4.D0*a*b*c2*f2*h4*i2*k*l*n4 + &
&4.D0*a2*c*d*f2*h4*i2*k*l*n4 + &
&4.D0*b2*d2*f2*g4*i*j*k*l*n4 + &
&32.D0*b2*d2*e*f*g3*h*i*j*k*l*n4 + &
&32.D0*b2*c*d*f2*g3*h*i*j*k*l*n4 + &
&32.D0*a*b*d2*f2*g3*h*i*j*k*l*n4 + &
&24.D0*b2*d2*e2*g2*h2*i*j*k*l*n4 + &
&96.D0*b2*c*d*e*f*g2*h2*i*j*k*l*n4 + &
&96.D0*a*b*d2*e*f*g2*h2*i*j*k*l*n4 + &
&24.D0*b2*c2*f2*g2*h2*i*j*k*l*n4 + &
&96.D0*a*b*c*d*f2*g2*h2*i*j*k*l*n4 + &
&24.D0*a2*d2*f2*g2*h2*i*j*k*l*n4 + &
&32.D0*b2*c*d*e2*g*h3*i*j*k*l*n4 + &
&32.D0*a*b*d2*e2*g*h3*i*j*k*l*n4 + &
&32.D0*b2*c2*e*f*g*h3*i*j*k*l*n4 + &
&128.D0*a*b*c*d*e*f*g*h3*i*j*k*l*n4 + &
&32.D0*a2*d2*e*f*g*h3*i*j*k*l*n4 + &
&32.D0*a*b*c2*f2*g*h3*i*j*k*l*n4 + &
&32.D0*a2*c*d*f2*g*h3*i*j*k*l*n4 + &
&4.D0*b2*c2*e2*h4*i*j*k*l*n4 + &
&16.D0*a*b*c*d*e2*h4*i*j*k*l*n4 + &
&4.D0*a2*d2*e2*h4*i*j*k*l*n4 + &
&16.D0*a*b*c2*e*f*h4*i*j*k*l*n4 + &
&16.D0*a2*c*d*e*f*h4*i*j*k*l*n4 + &
&4.D0*a2*c2*f2*h4*i*j*k*l*n4 + &
&4.D0*b2*d2*e*f*g4*j2*k*l*n4 + &
&4.D0*b2*c*d*f2*g4*j2*k*l*n4 + &
&4.D0*a*b*d2*f2*g4*j2*k*l*n4 + &
&8.D0*b2*d2*e2*g3*h*j2*k*l*n4 + &
&32.D0*b2*c*d*e*f*g3*h*j2*k*l*n4 + &
&32.D0*a*b*d2*e*f*g3*h*j2*k*l*n4 + &
&8.D0*b2*c2*f2*g3*h*j2*k*l*n4 + &
&32.D0*a*b*c*d*f2*g3*h*j2*k*l*n4 + &
&8.D0*a2*d2*f2*g3*h*j2*k*l*n4 + &
&24.D0*b2*c*d*e2*g2*h2*j2*k*l*n4 + &
&24.D0*a*b*d2*e2*g2*h2*j2*k*l*n4 + &
&24.D0*b2*c2*e*f*g2*h2*j2*k*l*n4 + &
&96.D0*a*b*c*d*e*f*g2*h2*j2*k*l*n4 + &
&24.D0*a2*d2*e*f*g2*h2*j2*k*l*n4 + &
&24.D0*a*b*c2*f2*g2*h2*j2*k*l*n4 + &
&24.D0*a2*c*d*f2*g2*h2*j2*k*l*n4 + &
&8.D0*b2*c2*e2*g*h3*j2*k*l*n4 + &
&32.D0*a*b*c*d*e2*g*h3*j2*k*l*n4 + &
&8.D0*a2*d2*e2*g*h3*j2*k*l*n4 + &
&32.D0*a*b*c2*e*f*g*h3*j2*k*l*n4 + &
&32.D0*a2*c*d*e*f*g*h3*j2*k*l*n4 + &
&8.D0*a2*c2*f2*g*h3*j2*k*l*n4 + &
&4.D0*a*b*c2*e2*h4*j2*k*l*n4 + &
&4.D0*a2*c*d*e2*h4*j2*k*l*n4 + &
&4.D0*a2*c2*e*f*h4*j2*k*l*n4 + &
&b2*d2*f2*g4*i2*l2*n4 + &
&8.D0*b2*d2*e*f*g3*h*i2*l2*n4 + &
&8.D0*b2*c*d*f2*g3*h*i2*l2*n4 + &
&8.D0*a*b*d2*f2*g3*h*i2*l2*n4 + &
&6.D0*b2*d2*e2*g2*h2*i2*l2*n4 + &
&24.D0*b2*c*d*e*f*g2*h2*i2*l2*n4 + &
&24.D0*a*b*d2*e*f*g2*h2*i2*l2*n4 + &
&6.D0*b2*c2*f2*g2*h2*i2*l2*n4 + &
&24.D0*a*b*c*d*f2*g2*h2*i2*l2*n4 + &
&6.D0*a2*d2*f2*g2*h2*i2*l2*n4 + &
&8.D0*b2*c*d*e2*g*h3*i2*l2*n4 + &
&8.D0*a*b*d2*e2*g*h3*i2*l2*n4 + &
&8.D0*b2*c2*e*f*g*h3*i2*l2*n4 + &
&32.D0*a*b*c*d*e*f*g*h3*i2*l2*n4 + &
&8.D0*a2*d2*e*f*g*h3*i2*l2*n4 + &
&8.D0*a*b*c2*f2*g*h3*i2*l2*n4 + &
&8.D0*a2*c*d*f2*g*h3*i2*l2*n4 + &
&b2*c2*e2*h4*i2*l2*n4 + &
&4.D0*a*b*c*d*e2*h4*i2*l2*n4 + &
&a2*d2*e2*h4*i2*l2*n4 + &
&4.D0*a*b*c2*e*f*h4*i2*l2*n4 + &
&4.D0*a2*c*d*e*f*h4*i2*l2*n4 + &
&a2*c2*f2*h4*i2*l2*n4 + &
&4.D0*b2*d2*e*f*g4*i*j*l2*n4 + &
&4.D0*b2*c*d*f2*g4*i*j*l2*n4 + &
&4.D0*a*b*d2*f2*g4*i*j*l2*n4 + &
&8.D0*b2*d2*e2*g3*h*i*j*l2*n4 + &
&32.D0*b2*c*d*e*f*g3*h*i*j*l2*n4 + &
&32.D0*a*b*d2*e*f*g3*h*i*j*l2*n4 + &
&8.D0*b2*c2*f2*g3*h*i*j*l2*n4 + &
&32.D0*a*b*c*d*f2*g3*h*i*j*l2*n4 + &
&8.D0*a2*d2*f2*g3*h*i*j*l2*n4 + &
&24.D0*b2*c*d*e2*g2*h2*i*j*l2*n4 + &
&24.D0*a*b*d2*e2*g2*h2*i*j*l2*n4 + &
&24.D0*b2*c2*e*f*g2*h2*i*j*l2*n4 + &
&96.D0*a*b*c*d*e*f*g2*h2*i*j*l2*n4 + &
&24.D0*a2*d2*e*f*g2*h2*i*j*l2*n4 + &
&24.D0*a*b*c2*f2*g2*h2*i*j*l2*n4 + &
&24.D0*a2*c*d*f2*g2*h2*i*j*l2*n4 + &
&8.D0*b2*c2*e2*g*h3*i*j*l2*n4 + &
&32.D0*a*b*c*d*e2*g*h3*i*j*l2*n4 + &
&8.D0*a2*d2*e2*g*h3*i*j*l2*n4 + &
&32.D0*a*b*c2*e*f*g*h3*i*j*l2*n4 + &
&32.D0*a2*c*d*e*f*g*h3*i*j*l2*n4 + &
&8.D0*a2*c2*f2*g*h3*i*j*l2*n4 + &
&4.D0*a*b*c2*e2*h4*i*j*l2*n4 + &
&4.D0*a2*c*d*e2*h4*i*j*l2*n4 + &
&4.D0*a2*c2*e*f*h4*i*j*l2*n4 + &
&b2*d2*e2*g4*j2*l2*n4 + &
&4.D0*b2*c*d*e*f*g4*j2*l2*n4 + &
&4.D0*a*b*d2*e*f*g4*j2*l2*n4 + &
&b2*c2*f2*g4*j2*l2*n4 + &
&4.D0*a*b*c*d*f2*g4*j2*l2*n4 + &
&a2*d2*f2*g4*j2*l2*n4 + &
&8.D0*b2*c*d*e2*g3*h*j2*l2*n4 + &
&8.D0*a*b*d2*e2*g3*h*j2*l2*n4 + &
&8.D0*b2*c2*e*f*g3*h*j2*l2*n4 + &
&32.D0*a*b*c*d*e*f*g3*h*j2*l2*n4 + &
&8.D0*a2*d2*e*f*g3*h*j2*l2*n4 + &
&8.D0*a*b*c2*f2*g3*h*j2*l2*n4 + &
&8.D0*a2*c*d*f2*g3*h*j2*l2*n4 + &
&6.D0*b2*c2*e2*g2*h2*j2*l2*n4 + &
&24.D0*a*b*c*d*e2*g2*h2*j2*l2*n4 + &
&6.D0*a2*d2*e2*g2*h2*j2*l2*n4 + &
&24.D0*a*b*c2*e*f*g2*h2*j2*l2*n4 + &
&24.D0*a2*c*d*e*f*g2*h2*j2*l2*n4 + &
&6.D0*a2*c2*f2*g2*h2*j2*l2*n4 + &
&8.D0*a*b*c2*e2*g*h3*j2*l2*n4 + &
&8.D0*a2*c*d*e2*g*h3*j2*l2*n4 + &
&8.D0*a2*c2*e*f*g*h3*j2*l2*n4 + &
&a2*c2*e2*h4*j2*l2*n4

IONIZ_PROBA(13)=2.D0*b2*d2*f2*h4*j2*k*l*m4 +&
&2.D0*b2*d2*f2*h4*i*j*l2*m4 +&
&4.D0*b2*d2*f2*g*h3*j2*l2*m4 +&
&2.D0*b2*d2*e*f*h4*j2*l2*m4 +&
&2.D0*b2*c*d*f2*h4*j2*l2*m4 +&
&2.D0*a*b*d2*f2*h4*j2*l2*m4 +&
&4.D0*b2*d2*f2*h4*j2*k2*m3*n +&
&16.D0*b2*d2*f2*h4*i*j*k*l*m3*n +&
&32.D0*b2*d2*f2*g*h3*j2*k*l*m3*n +&
&16.D0*b2*d2*e*f*h4*j2*k*l*m3*n +&
&16.D0*b2*c*d*f2*h4*j2*k*l*m3*n +&
&16.D0*a*b*d2*f2*h4*j2*k*l*m3*n +&
&4.D0*b2*d2*f2*h4*i2*l2*m3*n +&
&32.D0*b2*d2*f2*g*h3*i*j*l2*m3*n +&
&16.D0*b2*d2*e*f*h4*i*j*l2*m3*n +&
&16.D0*b2*c*d*f2*h4*i*j*l2*m3*n +&
&16.D0*a*b*d2*f2*h4*i*j*l2*m3*n +&
&24.D0*b2*d2*f2*g2*h2*j2*l2*m3*n +&
&32.D0*b2*d2*e*f*g*h3*j2*l2*m3*n +&
&32.D0*b2*c*d*f2*g*h3*j2*l2*m3*n +&
&32.D0*a*b*d2*f2*g*h3*j2*l2*m3*n +&
&4.D0*b2*d2*e2*h4*j2*l2*m3*n +&
&16.D0*b2*c*d*e*f*h4*j2*l2*m3*n +&
&16.D0*a*b*d2*e*f*h4*j2*l2*m3*n +&
&4.D0*b2*c2*f2*h4*j2*l2*m3*n +&
&16.D0*a*b*c*d*f2*h4*j2*l2*m3*n +&
&4.D0*a2*d2*f2*h4*j2*l2*m3*n +&
&12.D0*b2*d2*f2*h4*i*j*k2*m2*n2 +&
&24.D0*b2*d2*f2*g*h3*j2*k2*m2*n2 +&
&12.D0*b2*d2*e*f*h4*j2*k2*m2*n2 +&
&12.D0*b2*c*d*f2*h4*j2*k2*m2*n2 +&
&12.D0*a*b*d2*f2*h4*j2*k2*m2*n2 +&
&12.D0*b2*d2*f2*h4*i2*k*l*m2*n2 +&
&96.D0*b2*d2*f2*g*h3*i*j*k*l*m2*n2 +&
&48.D0*b2*d2*e*f*h4*i*j*k*l*m2*n2 +&
&48.D0*b2*c*d*f2*h4*i*j*k*l*m2*n2 +&
&48.D0*a*b*d2*f2*h4*i*j*k*l*m2*n2 +&
&72.D0*b2*d2*f2*g2*h2*j2*k*l*m2*n2 +&
&96.D0*b2*d2*e*f*g*h3*j2*k*l*m2*n2 +&
&96.D0*b2*c*d*f2*g*h3*j2*k*l*m2*n2 +&
&96.D0*a*b*d2*f2*g*h3*j2*k*l*m2*n2 +&
&12.D0*b2*d2*e2*h4*j2*k*l*m2*n2 +&
&48.D0*b2*c*d*e*f*h4*j2*k*l*m2*n2 +&
&48.D0*a*b*d2*e*f*h4*j2*k*l*m2*n2 +&
&12.D0*b2*c2*f2*h4*j2*k*l*m2*n2 +&
&48.D0*a*b*c*d*f2*h4*j2*k*l*m2*n2 +&
&12.D0*a2*d2*f2*h4*j2*k*l*m2*n2 +&
&24.D0*b2*d2*f2*g*h3*i2*l2*m2*n2 +&
&12.D0*b2*d2*e*f*h4*i2*l2*m2*n2 +&
&12.D0*b2*c*d*f2*h4*i2*l2*m2*n2 +&
&12.D0*a*b*d2*f2*h4*i2*l2*m2*n2 +&
&72.D0*b2*d2*f2*g2*h2*i*j*l2*m2*n2 +&
&96.D0*b2*d2*e*f*g*h3*i*j*l2*m2*n2 +&
&96.D0*b2*c*d*f2*g*h3*i*j*l2*m2*n2 +&
&96.D0*a*b*d2*f2*g*h3*i*j*l2*m2*n2 +&
&12.D0*b2*d2*e2*h4*i*j*l2*m2*n2 +&
&48.D0*b2*c*d*e*f*h4*i*j*l2*m2*n2 +&
&48.D0*a*b*d2*e*f*h4*i*j*l2*m2*n2 +&
&12.D0*b2*c2*f2*h4*i*j*l2*m2*n2 +&
&48.D0*a*b*c*d*f2*h4*i*j*l2*m2*n2 +&
&12.D0*a2*d2*f2*h4*i*j*l2*m2*n2 +&
&24.D0*b2*d2*f2*g3*h*j2*l2*m2*n2 +&
&72.D0*b2*d2*e*f*g2*h2*j2*l2*m2*n2 +&
&72.D0*b2*c*d*f2*g2*h2*j2*l2*m2*n2 +&
&72.D0*a*b*d2*f2*g2*h2*j2*l2*m2*n2 +&
&24.D0*b2*d2*e2*g*h3*j2*l2*m2*n2 +&
&96.D0*b2*c*d*e*f*g*h3*j2*l2*m2*n2 +&
&96.D0*a*b*d2*e*f*g*h3*j2*l2*m2*n2 +&
&24.D0*b2*c2*f2*g*h3*j2*l2*m2*n2 +&
&96.D0*a*b*c*d*f2*g*h3*j2*l2*m2*n2 +&
&24.D0*a2*d2*f2*g*h3*j2*l2*m2*n2 +&
&12.D0*b2*c*d*e2*h4*j2*l2*m2*n2 +&
&12.D0*a*b*d2*e2*h4*j2*l2*m2*n2 +&
&12.D0*b2*c2*e*f*h4*j2*l2*m2*n2 +&
&48.D0*a*b*c*d*e*f*h4*j2*l2*m2*n2 +&
&12.D0*a2*d2*e*f*h4*j2*l2*m2*n2 +&
&12.D0*a*b*c2*f2*h4*j2*l2*m2*n2 +&
&12.D0*a2*c*d*f2*h4*j2*l2*m2*n2 +&
&4.D0*b2*d2*f2*h4*i2*k2*m*n3 +&
&32.D0*b2*d2*f2*g*h3*i*j*k2*m*n3 +&
&16.D0*b2*d2*e*f*h4*i*j*k2*m*n3 +&
&16.D0*b2*c*d*f2*h4*i*j*k2*m*n3 +&
&16.D0*a*b*d2*f2*h4*i*j*k2*m*n3 +&
&24.D0*b2*d2*f2*g2*h2*j2*k2*m*n3 +&
&32.D0*b2*d2*e*f*g*h3*j2*k2*m*n3 +&
&32.D0*b2*c*d*f2*g*h3*j2*k2*m*n3 +&
&32.D0*a*b*d2*f2*g*h3*j2*k2*m*n3 +&
&4.D0*b2*d2*e2*h4*j2*k2*m*n3 +&
&16.D0*b2*c*d*e*f*h4*j2*k2*m*n3 +&
&16.D0*a*b*d2*e*f*h4*j2*k2*m*n3 +&
&4.D0*b2*c2*f2*h4*j2*k2*m*n3 +&
&16.D0*a*b*c*d*f2*h4*j2*k2*m*n3 +&
&4.D0*a2*d2*f2*h4*j2*k2*m*n3 +&
&32.D0*b2*d2*f2*g*h3*i2*k*l*m*n3 +&
&16.D0*b2*d2*e*f*h4*i2*k*l*m*n3 +&
&16.D0*b2*c*d*f2*h4*i2*k*l*m*n3 +&
&16.D0*a*b*d2*f2*h4*i2*k*l*m*n3 +&
&96.D0*b2*d2*f2*g2*h2*i*j*k*l*m*n3 +&
&128.D0*b2*d2*e*f*g*h3*i*j*k*l*m*n3 +&
&128.D0*b2*c*d*f2*g*h3*i*j*k*l*m*n3 +&
&128.D0*a*b*d2*f2*g*h3*i*j*k*l*m*n3 +&
&16.D0*b2*d2*e2*h4*i*j*k*l*m*n3 +&
&64.D0*b2*c*d*e*f*h4*i*j*k*l*m*n3 +&
&64.D0*a*b*d2*e*f*h4*i*j*k*l*m*n3 +&
&16.D0*b2*c2*f2*h4*i*j*k*l*m*n3 +&
&64.D0*a*b*c*d*f2*h4*i*j*k*l*m*n3 +&
&16.D0*a2*d2*f2*h4*i*j*k*l*m*n3 +&
&32.D0*b2*d2*f2*g3*h*j2*k*l*m*n3 +&
&96.D0*b2*d2*e*f*g2*h2*j2*k*l*m*n3 +&
&96.D0*b2*c*d*f2*g2*h2*j2*k*l*m*n3 +&
&96.D0*a*b*d2*f2*g2*h2*j2*k*l*m*n3 +&
&32.D0*b2*d2*e2*g*h3*j2*k*l*m*n3 +&
&128.D0*b2*c*d*e*f*g*h3*j2*k*l*m*n3 +&
&128.D0*a*b*d2*e*f*g*h3*j2*k*l*m*n3 +&
&32.D0*b2*c2*f2*g*h3*j2*k*l*m*n3 +&
&128.D0*a*b*c*d*f2*g*h3*j2*k*l*m*n3 +&
&32.D0*a2*d2*f2*g*h3*j2*k*l*m*n3 +&
&16.D0*b2*c*d*e2*h4*j2*k*l*m*n3 +&
&16.D0*a*b*d2*e2*h4*j2*k*l*m*n3 +&
&16.D0*b2*c2*e*f*h4*j2*k*l*m*n3 +&
&64.D0*a*b*c*d*e*f*h4*j2*k*l*m*n3 +&
&16.D0*a2*d2*e*f*h4*j2*k*l*m*n3 +&
&16.D0*a*b*c2*f2*h4*j2*k*l*m*n3 +&
&16.D0*a2*c*d*f2*h4*j2*k*l*m*n3 +&
&24.D0*b2*d2*f2*g2*h2*i2*l2*m*n3 +&
&32.D0*b2*d2*e*f*g*h3*i2*l2*m*n3 +&
&32.D0*b2*c*d*f2*g*h3*i2*l2*m*n3 +&
&32.D0*a*b*d2*f2*g*h3*i2*l2*m*n3 +&
&4.D0*b2*d2*e2*h4*i2*l2*m*n3 +&
&16.D0*b2*c*d*e*f*h4*i2*l2*m*n3 +&
&16.D0*a*b*d2*e*f*h4*i2*l2*m*n3 +&
&4.D0*b2*c2*f2*h4*i2*l2*m*n3 +&
&16.D0*a*b*c*d*f2*h4*i2*l2*m*n3 +&
&4.D0*a2*d2*f2*h4*i2*l2*m*n3 +&
&32.D0*b2*d2*f2*g3*h*i*j*l2*m*n3 +&
&96.D0*b2*d2*e*f*g2*h2*i*j*l2*m*n3 +&
&96.D0*b2*c*d*f2*g2*h2*i*j*l2*m*n3 +&
&96.D0*a*b*d2*f2*g2*h2*i*j*l2*m*n3 +&
&32.D0*b2*d2*e2*g*h3*i*j*l2*m*n3 +&
&128.D0*b2*c*d*e*f*g*h3*i*j*l2*m*n3 +&
&128.D0*a*b*d2*e*f*g*h3*i*j*l2*m*n3 +&
&32.D0*b2*c2*f2*g*h3*i*j*l2*m*n3 +&
&128.D0*a*b*c*d*f2*g*h3*i*j*l2*m*n3 +&
&32.D0*a2*d2*f2*g*h3*i*j*l2*m*n3 +&
&16.D0*b2*c*d*e2*h4*i*j*l2*m*n3 +&
&16.D0*a*b*d2*e2*h4*i*j*l2*m*n3 +&
&16.D0*b2*c2*e*f*h4*i*j*l2*m*n3 +&
&64.D0*a*b*c*d*e*f*h4*i*j*l2*m*n3 +&
&16.D0*a2*d2*e*f*h4*i*j*l2*m*n3 +&
&16.D0*a*b*c2*f2*h4*i*j*l2*m*n3 +&
&16.D0*a2*c*d*f2*h4*i*j*l2*m*n3 +&
&4.D0*b2*d2*f2*g4*j2*l2*m*n3 +&
&32.D0*b2*d2*e*f*g3*h*j2*l2*m*n3 +&
&32.D0*b2*c*d*f2*g3*h*j2*l2*m*n3 +&
&32.D0*a*b*d2*f2*g3*h*j2*l2*m*n3 +&
&24.D0*b2*d2*e2*g2*h2*j2*l2*m*n3 +&
&96.D0*b2*c*d*e*f*g2*h2*j2*l2*m*n3 +&
&96.D0*a*b*d2*e*f*g2*h2*j2*l2*m*n3 +&
&24.D0*b2*c2*f2*g2*h2*j2*l2*m*n3 +&
&96.D0*a*b*c*d*f2*g2*h2*j2*l2*m*n3 +&
&24.D0*a2*d2*f2*g2*h2*j2*l2*m*n3 +&
&32.D0*b2*c*d*e2*g*h3*j2*l2*m*n3 +&
&32.D0*a*b*d2*e2*g*h3*j2*l2*m*n3 +&
&32.D0*b2*c2*e*f*g*h3*j2*l2*m*n3 +&
&128.D0*a*b*c*d*e*f*g*h3*j2*l2*m*n3 +&
&32.D0*a2*d2*e*f*g*h3*j2*l2*m*n3 +&
&32.D0*a*b*c2*f2*g*h3*j2*l2*m*n3 +&
&32.D0*a2*c*d*f2*g*h3*j2*l2*m*n3 +&
&4.D0*b2*c2*e2*h4*j2*l2*m*n3 +&
&16.D0*a*b*c*d*e2*h4*j2*l2*m*n3 +&
&4.D0*a2*d2*e2*h4*j2*l2*m*n3 +&
&16.D0*a*b*c2*e*f*h4*j2*l2*m*n3 +&
&16.D0*a2*c*d*e*f*h4*j2*l2*m*n3 +&
&4.D0*a2*c2*f2*h4*j2*l2*m*n3 +&
&4.D0*b2*d2*f2*g*h3*i2*k2*n4 +&
&2.D0*b2*d2*e*f*h4*i2*k2*n4 +&
&2.D0*b2*c*d*f2*h4*i2*k2*n4 +&
&2.D0*a*b*d2*f2*h4*i2*k2*n4 +&
&12.D0*b2*d2*f2*g2*h2*i*j*k2*n4 +&
&16.D0*b2*d2*e*f*g*h3*i*j*k2*n4 +&
&16.D0*b2*c*d*f2*g*h3*i*j*k2*n4 +&
&16.D0*a*b*d2*f2*g*h3*i*j*k2*n4 +&
&2.D0*b2*d2*e2*h4*i*j*k2*n4 +&
&8.D0*b2*c*d*e*f*h4*i*j*k2*n4 +&
&8.D0*a*b*d2*e*f*h4*i*j*k2*n4 +&
&2.D0*b2*c2*f2*h4*i*j*k2*n4 +&
&8.D0*a*b*c*d*f2*h4*i*j*k2*n4 +&
&2.D0*a2*d2*f2*h4*i*j*k2*n4 +&
&4.D0*b2*d2*f2*g3*h*j2*k2*n4 +&
&12.D0*b2*d2*e*f*g2*h2*j2*k2*n4 +&
&12.D0*b2*c*d*f2*g2*h2*j2*k2*n4 +&
&12.D0*a*b*d2*f2*g2*h2*j2*k2*n4 +&
&4.D0*b2*d2*e2*g*h3*j2*k2*n4 +&
&16.D0*b2*c*d*e*f*g*h3*j2*k2*n4 +&
&16.D0*a*b*d2*e*f*g*h3*j2*k2*n4 +&
&4.D0*b2*c2*f2*g*h3*j2*k2*n4 +&
&16.D0*a*b*c*d*f2*g*h3*j2*k2*n4 +&
&4.D0*a2*d2*f2*g*h3*j2*k2*n4 +&
&2.D0*b2*c*d*e2*h4*j2*k2*n4 +&
&2.D0*a*b*d2*e2*h4*j2*k2*n4 +&
&2.D0*b2*c2*e*f*h4*j2*k2*n4 +&
&8.D0*a*b*c*d*e*f*h4*j2*k2*n4 +&
&2.D0*a2*d2*e*f*h4*j2*k2*n4 +&
&2.D0*a*b*c2*f2*h4*j2*k2*n4 +&
&2.D0*a2*c*d*f2*h4*j2*k2*n4 +&
&12.D0*b2*d2*f2*g2*h2*i2*k*l*n4 +&
&16.D0*b2*d2*e*f*g*h3*i2*k*l*n4 +&
&16.D0*b2*c*d*f2*g*h3*i2*k*l*n4 +&
&16.D0*a*b*d2*f2*g*h3*i2*k*l*n4 +&
&2.D0*b2*d2*e2*h4*i2*k*l*n4 +&
&8.D0*b2*c*d*e*f*h4*i2*k*l*n4 +&
&8.D0*a*b*d2*e*f*h4*i2*k*l*n4 +&
&2.D0*b2*c2*f2*h4*i2*k*l*n4 +&
&8.D0*a*b*c*d*f2*h4*i2*k*l*n4 +&
&2.D0*a2*d2*f2*h4*i2*k*l*n4 +&
&16.D0*b2*d2*f2*g3*h*i*j*k*l*n4 +&
&48.D0*b2*d2*e*f*g2*h2*i*j*k*l*n4 +&
&48.D0*b2*c*d*f2*g2*h2*i*j*k*l*n4 +&
&48.D0*a*b*d2*f2*g2*h2*i*j*k*l*n4 +&
&16.D0*b2*d2*e2*g*h3*i*j*k*l*n4 +&
&64.D0*b2*c*d*e*f*g*h3*i*j*k*l*n4 +&
&64.D0*a*b*d2*e*f*g*h3*i*j*k*l*n4 +&
&16.D0*b2*c2*f2*g*h3*i*j*k*l*n4 +&
&64.D0*a*b*c*d*f2*g*h3*i*j*k*l*n4 +&
&16.D0*a2*d2*f2*g*h3*i*j*k*l*n4 +&
&8.D0*b2*c*d*e2*h4*i*j*k*l*n4 +&
&8.D0*a*b*d2*e2*h4*i*j*k*l*n4 +&
&8.D0*b2*c2*e*f*h4*i*j*k*l*n4 +&
&32.D0*a*b*c*d*e*f*h4*i*j*k*l*n4 +&
&8.D0*a2*d2*e*f*h4*i*j*k*l*n4 +&
&8.D0*a*b*c2*f2*h4*i*j*k*l*n4 +&
&8.D0*a2*c*d*f2*h4*i*j*k*l*n4 +&
&2.D0*b2*d2*f2*g4*j2*k*l*n4 +&
&16.D0*b2*d2*e*f*g3*h*j2*k*l*n4 +&
&16.D0*b2*c*d*f2*g3*h*j2*k*l*n4 +&
&16.D0*a*b*d2*f2*g3*h*j2*k*l*n4 +&
&12.D0*b2*d2*e2*g2*h2*j2*k*l*n4 +&
&48.D0*b2*c*d*e*f*g2*h2*j2*k*l*n4 +&
&48.D0*a*b*d2*e*f*g2*h2*j2*k*l*n4 +&
&12.D0*b2*c2*f2*g2*h2*j2*k*l*n4 +&
&48.D0*a*b*c*d*f2*g2*h2*j2*k*l*n4 +&
&12.D0*a2*d2*f2*g2*h2*j2*k*l*n4 +&
&16.D0*b2*c*d*e2*g*h3*j2*k*l*n4 +&
&16.D0*a*b*d2*e2*g*h3*j2*k*l*n4 +&
&16.D0*b2*c2*e*f*g*h3*j2*k*l*n4 +&
&64.D0*a*b*c*d*e*f*g*h3*j2*k*l*n4 +&
&16.D0*a2*d2*e*f*g*h3*j2*k*l*n4 +&
&16.D0*a*b*c2*f2*g*h3*j2*k*l*n4 +&
&16.D0*a2*c*d*f2*g*h3*j2*k*l*n4 +&
&2.D0*b2*c2*e2*h4*j2*k*l*n4 +&
&8.D0*a*b*c*d*e2*h4*j2*k*l*n4 +&
&2.D0*a2*d2*e2*h4*j2*k*l*n4 +&
&8.D0*a*b*c2*e*f*h4*j2*k*l*n4 +&
&8.D0*a2*c*d*e*f*h4*j2*k*l*n4 +&
&2.D0*a2*c2*f2*h4*j2*k*l*n4 +&
&4.D0*b2*d2*f2*g3*h*i2*l2*n4 +&
&12.D0*b2*d2*e*f*g2*h2*i2*l2*n4 +&
&12.D0*b2*c*d*f2*g2*h2*i2*l2*n4 +&
&12.D0*a*b*d2*f2*g2*h2*i2*l2*n4 +&
&4.D0*b2*d2*e2*g*h3*i2*l2*n4 +&
&16.D0*b2*c*d*e*f*g*h3*i2*l2*n4 +&
&16.D0*a*b*d2*e*f*g*h3*i2*l2*n4 +&
&4.D0*b2*c2*f2*g*h3*i2*l2*n4 +&
&16.D0*a*b*c*d*f2*g*h3*i2*l2*n4 +&
&4.D0*a2*d2*f2*g*h3*i2*l2*n4 +&
&2.D0*b2*c*d*e2*h4*i2*l2*n4 +&
&2.D0*a*b*d2*e2*h4*i2*l2*n4 +&
&2.D0*b2*c2*e*f*h4*i2*l2*n4 +&
&8.D0*a*b*c*d*e*f*h4*i2*l2*n4 +&
&2.D0*a2*d2*e*f*h4*i2*l2*n4 +&
&2.D0*a*b*c2*f2*h4*i2*l2*n4 +&
&2.D0*a2*c*d*f2*h4*i2*l2*n4 +&
&2.D0*b2*d2*f2*g4*i*j*l2*n4 +&
&16.D0*b2*d2*e*f*g3*h*i*j*l2*n4 +&
&16.D0*b2*c*d*f2*g3*h*i*j*l2*n4 +&
&16.D0*a*b*d2*f2*g3*h*i*j*l2*n4 +&
&12.D0*b2*d2*e2*g2*h2*i*j*l2*n4 +&
&48.D0*b2*c*d*e*f*g2*h2*i*j*l2*n4 +&
&48.D0*a*b*d2*e*f*g2*h2*i*j*l2*n4 +&
&12.D0*b2*c2*f2*g2*h2*i*j*l2*n4 +&
&48.D0*a*b*c*d*f2*g2*h2*i*j*l2*n4 +&
&12.D0*a2*d2*f2*g2*h2*i*j*l2*n4 +&
&16.D0*b2*c*d*e2*g*h3*i*j*l2*n4 +&
&16.D0*a*b*d2*e2*g*h3*i*j*l2*n4 +&
&16.D0*b2*c2*e*f*g*h3*i*j*l2*n4 +&
&64.D0*a*b*c*d*e*f*g*h3*i*j*l2*n4 +&
&16.D0*a2*d2*e*f*g*h3*i*j*l2*n4 +&
&16.D0*a*b*c2*f2*g*h3*i*j*l2*n4 +&
&16.D0*a2*c*d*f2*g*h3*i*j*l2*n4 +&
&2.D0*b2*c2*e2*h4*i*j*l2*n4 +&
&8.D0*a*b*c*d*e2*h4*i*j*l2*n4 +&
&2.D0*a2*d2*e2*h4*i*j*l2*n4 +&
&8.D0*a*b*c2*e*f*h4*i*j*l2*n4 +&
&8.D0*a2*c*d*e*f*h4*i*j*l2*n4 +&
&2.D0*a2*c2*f2*h4*i*j*l2*n4 +&
&2.D0*b2*d2*e*f*g4*j2*l2*n4 +&
&2.D0*b2*c*d*f2*g4*j2*l2*n4 +&
&2.D0*a*b*d2*f2*g4*j2*l2*n4 +&
&4.D0*b2*d2*e2*g3*h*j2*l2*n4 +&
&16.D0*b2*c*d*e*f*g3*h*j2*l2*n4 +&
&16.D0*a*b*d2*e*f*g3*h*j2*l2*n4 +&
&4.D0*b2*c2*f2*g3*h*j2*l2*n4 +&
&16.D0*a*b*c*d*f2*g3*h*j2*l2*n4 +&
&4.D0*a2*d2*f2*g3*h*j2*l2*n4 +&
&12.D0*b2*c*d*e2*g2*h2*j2*l2*n4 +&
&12.D0*a*b*d2*e2*g2*h2*j2*l2*n4 +&
&12.D0*b2*c2*e*f*g2*h2*j2*l2*n4 +&
&48.D0*a*b*c*d*e*f*g2*h2*j2*l2*n4 +&
&12.D0*a2*d2*e*f*g2*h2*j2*l2*n4 +&
&12.D0*a*b*c2*f2*g2*h2*j2*l2*n4 +&
&12.D0*a2*c*d*f2*g2*h2*j2*l2*n4 +&
&4.D0*b2*c2*e2*g*h3*j2*l2*n4 +&
&16.D0*a*b*c*d*e2*g*h3*j2*l2*n4 +&
&4.D0*a2*d2*e2*g*h3*j2*l2*n4 +&
&16.D0*a*b*c2*e*f*g*h3*j2*l2*n4 +&
&16.D0*a2*c*d*e*f*g*h3*j2*l2*n4 +&
&4.D0*a2*c2*f2*g*h3*j2*l2*n4 +&
&2.D0*a*b*c2*e2*h4*j2*l2*n4 +&
&2.D0*a2*c*d*e2*h4*j2*l2*n4 +&
&2.D0*a2*c2*e*f*h4*j2*l2*n4

IONIZ_PROBA(14)=b2*d2*f2*h4*j2*l2*m4 + &
&8.D0*b2*d2*f2*h4*j2*k*l*m3*n + &
&8.D0*b2*d2*f2*h4*i*j*l2*m3*n + &
&16.D0*b2*d2*f2*g*h3*j2*l2*m3*n + &
&8.D0*b2*d2*e*f*h4*j2*l2*m3*n + &
&8.D0*b2*c*d*f2*h4*j2*l2*m3*n + &
&8.D0*a*b*d2*f2*h4*j2*l2*m3*n + &
&6.D0*b2*d2*f2*h4*j2*k2*m2*n2 + &
&24.D0*b2*d2*f2*h4*i*j*k*l*m2*n2 + &
&48.D0*b2*d2*f2*g*h3*j2*k*l*m2*n2 + &
&24.D0*b2*d2*e*f*h4*j2*k*l*m2*n2 + &
&24.D0*b2*c*d*f2*h4*j2*k*l*m2*n2 + &
&24.D0*a*b*d2*f2*h4*j2*k*l*m2*n2 + &
&6.D0*b2*d2*f2*h4*i2*l2*m2*n2 + &
&48.D0*b2*d2*f2*g*h3*i*j*l2*m2*n2 + &
&24.D0*b2*d2*e*f*h4*i*j*l2*m2*n2 + &
&24.D0*b2*c*d*f2*h4*i*j*l2*m2*n2 + &
&24.D0*a*b*d2*f2*h4*i*j*l2*m2*n2 + &
&36.D0*b2*d2*f2*g2*h2*j2*l2*m2*n2 + &
&48.D0*b2*d2*e*f*g*h3*j2*l2*m2*n2 + &
&48.D0*b2*c*d*f2*g*h3*j2*l2*m2*n2 + &
&48.D0*a*b*d2*f2*g*h3*j2*l2*m2*n2 + &
&6.D0*b2*d2*e2*h4*j2*l2*m2*n2 + &
&24.D0*b2*c*d*e*f*h4*j2*l2*m2*n2 + &
&24.D0*a*b*d2*e*f*h4*j2*l2*m2*n2 + &
&6.D0*b2*c2*f2*h4*j2*l2*m2*n2 + &
&24.D0*a*b*c*d*f2*h4*j2*l2*m2*n2 + &
&6.D0*a2*d2*f2*h4*j2*l2*m2*n2 + &
&8.D0*b2*d2*f2*h4*i*j*k2*m*n3 + &
&16.D0*b2*d2*f2*g*h3*j2*k2*m*n3 + &
&8.D0*b2*d2*e*f*h4*j2*k2*m*n3 + &
&8.D0*b2*c*d*f2*h4*j2*k2*m*n3 + &
&8.D0*a*b*d2*f2*h4*j2*k2*m*n3 + &
&8.D0*b2*d2*f2*h4*i2*k*l*m*n3 + &
&64.D0*b2*d2*f2*g*h3*i*j*k*l*m*n3 + &
&32.D0*b2*d2*e*f*h4*i*j*k*l*m*n3 + &
&32.D0*b2*c*d*f2*h4*i*j*k*l*m*n3 + &
&32.D0*a*b*d2*f2*h4*i*j*k*l*m*n3 + &
&48.D0*b2*d2*f2*g2*h2*j2*k*l*m*n3 + &
&64.D0*b2*d2*e*f*g*h3*j2*k*l*m*n3 + &
&64.D0*b2*c*d*f2*g*h3*j2*k*l*m*n3 + &
&64.D0*a*b*d2*f2*g*h3*j2*k*l*m*n3 + &
&8.D0*b2*d2*e2*h4*j2*k*l*m*n3 + &
&32.D0*b2*c*d*e*f*h4*j2*k*l*m*n3 + &
&32.D0*a*b*d2*e*f*h4*j2*k*l*m*n3 + &
&8.D0*b2*c2*f2*h4*j2*k*l*m*n3 + &
&32.D0*a*b*c*d*f2*h4*j2*k*l*m*n3 + &
&8.D0*a2*d2*f2*h4*j2*k*l*m*n3 + &
&16.D0*b2*d2*f2*g*h3*i2*l2*m*n3 + &
&8.D0*b2*d2*e*f*h4*i2*l2*m*n3 + &
&8.D0*b2*c*d*f2*h4*i2*l2*m*n3 + &
&8.D0*a*b*d2*f2*h4*i2*l2*m*n3 + &
&48.D0*b2*d2*f2*g2*h2*i*j*l2*m*n3 + &
&64.D0*b2*d2*e*f*g*h3*i*j*l2*m*n3 + &
&64.D0*b2*c*d*f2*g*h3*i*j*l2*m*n3 + &
&64.D0*a*b*d2*f2*g*h3*i*j*l2*m*n3 + &
&8.D0*b2*d2*e2*h4*i*j*l2*m*n3 + &
&32.D0*b2*c*d*e*f*h4*i*j*l2*m*n3 + &
&32.D0*a*b*d2*e*f*h4*i*j*l2*m*n3 + &
&8.D0*b2*c2*f2*h4*i*j*l2*m*n3 + &
&32.D0*a*b*c*d*f2*h4*i*j*l2*m*n3 + &
&8.D0*a2*d2*f2*h4*i*j*l2*m*n3 + &
&16.D0*b2*d2*f2*g3*h*j2*l2*m*n3 + &
&48.D0*b2*d2*e*f*g2*h2*j2*l2*m*n3 + &
&48.D0*b2*c*d*f2*g2*h2*j2*l2*m*n3 + &
&48.D0*a*b*d2*f2*g2*h2*j2*l2*m*n3 + &
&16.D0*b2*d2*e2*g*h3*j2*l2*m*n3 + &
&64.D0*b2*c*d*e*f*g*h3*j2*l2*m*n3 + &
&64.D0*a*b*d2*e*f*g*h3*j2*l2*m*n3 + &
&16.D0*b2*c2*f2*g*h3*j2*l2*m*n3 + &
&64.D0*a*b*c*d*f2*g*h3*j2*l2*m*n3 + &
&16.D0*a2*d2*f2*g*h3*j2*l2*m*n3 + &
&8.D0*b2*c*d*e2*h4*j2*l2*m*n3 + &
&8.D0*a*b*d2*e2*h4*j2*l2*m*n3 + &
&8.D0*b2*c2*e*f*h4*j2*l2*m*n3 + &
&32.D0*a*b*c*d*e*f*h4*j2*l2*m*n3 + &
&8.D0*a2*d2*e*f*h4*j2*l2*m*n3 + &
&8.D0*a*b*c2*f2*h4*j2*l2*m*n3 + &
&8.D0*a2*c*d*f2*h4*j2*l2*m*n3 + &
&b2*d2*f2*h4*i2*k2*n4 + &
&8.D0*b2*d2*f2*g*h3*i*j*k2*n4 + &
&4.D0*b2*d2*e*f*h4*i*j*k2*n4 + &
&4.D0*b2*c*d*f2*h4*i*j*k2*n4 + &
&4.D0*a*b*d2*f2*h4*i*j*k2*n4 + &
&6.D0*b2*d2*f2*g2*h2*j2*k2*n4 + &
&8.D0*b2*d2*e*f*g*h3*j2*k2*n4 + &
&8.D0*b2*c*d*f2*g*h3*j2*k2*n4 + &
&8.D0*a*b*d2*f2*g*h3*j2*k2*n4 + &
&b2*d2*e2*h4*j2*k2*n4 + &
&4.D0*b2*c*d*e*f*h4*j2*k2*n4 + &
&4.D0*a*b*d2*e*f*h4*j2*k2*n4 + &
&b2*c2*f2*h4*j2*k2*n4 + &
&4.D0*a*b*c*d*f2*h4*j2*k2*n4 + &
&a2*d2*f2*h4*j2*k2*n4 + &
&8.D0*b2*d2*f2*g*h3*i2*k*l*n4 + &
&4.D0*b2*d2*e*f*h4*i2*k*l*n4 + &
&4.D0*b2*c*d*f2*h4*i2*k*l*n4 + &
&4.D0*a*b*d2*f2*h4*i2*k*l*n4 + &
&24.D0*b2*d2*f2*g2*h2*i*j*k*l*n4 + &
&32.D0*b2*d2*e*f*g*h3*i*j*k*l*n4 + &
&32.D0*b2*c*d*f2*g*h3*i*j*k*l*n4 + &
&32.D0*a*b*d2*f2*g*h3*i*j*k*l*n4 + &
&4.D0*b2*d2*e2*h4*i*j*k*l*n4 + &
&16.D0*b2*c*d*e*f*h4*i*j*k*l*n4 + &
&16.D0*a*b*d2*e*f*h4*i*j*k*l*n4 + &
&4.D0*b2*c2*f2*h4*i*j*k*l*n4 + &
&16.D0*a*b*c*d*f2*h4*i*j*k*l*n4 + &
&4.D0*a2*d2*f2*h4*i*j*k*l*n4 + &
&8.D0*b2*d2*f2*g3*h*j2*k*l*n4 + &
&24.D0*b2*d2*e*f*g2*h2*j2*k*l*n4 + &
&24.D0*b2*c*d*f2*g2*h2*j2*k*l*n4 + &
&24.D0*a*b*d2*f2*g2*h2*j2*k*l*n4 + &
&8.D0*b2*d2*e2*g*h3*j2*k*l*n4 + &
&32.D0*b2*c*d*e*f*g*h3*j2*k*l*n4 + &
&32.D0*a*b*d2*e*f*g*h3*j2*k*l*n4 + &
&8.D0*b2*c2*f2*g*h3*j2*k*l*n4 + &
&32.D0*a*b*c*d*f2*g*h3*j2*k*l*n4 + &
&8.D0*a2*d2*f2*g*h3*j2*k*l*n4 + &
&4.D0*b2*c*d*e2*h4*j2*k*l*n4 + &
&4.D0*a*b*d2*e2*h4*j2*k*l*n4 + &
&4.D0*b2*c2*e*f*h4*j2*k*l*n4 + &
&16.D0*a*b*c*d*e*f*h4*j2*k*l*n4 + &
&4.D0*a2*d2*e*f*h4*j2*k*l*n4 + &
&4.D0*a*b*c2*f2*h4*j2*k*l*n4 + &
&4.D0*a2*c*d*f2*h4*j2*k*l*n4 + &
&6.D0*b2*d2*f2*g2*h2*i2*l2*n4 + &
&8.D0*b2*d2*e*f*g*h3*i2*l2*n4 + &
&8.D0*b2*c*d*f2*g*h3*i2*l2*n4 + &
&8.D0*a*b*d2*f2*g*h3*i2*l2*n4 + &
&b2*d2*e2*h4*i2*l2*n4 + &
&4.D0*b2*c*d*e*f*h4*i2*l2*n4 + &
&4.D0*a*b*d2*e*f*h4*i2*l2*n4 + &
&b2*c2*f2*h4*i2*l2*n4 + &
&4.D0*a*b*c*d*f2*h4*i2*l2*n4 + &
&a2*d2*f2*h4*i2*l2*n4 + &
&8.D0*b2*d2*f2*g3*h*i*j*l2*n4 + &
&24.D0*b2*d2*e*f*g2*h2*i*j*l2*n4 + &
&24.D0*b2*c*d*f2*g2*h2*i*j*l2*n4 + &
&24.D0*a*b*d2*f2*g2*h2*i*j*l2*n4 + &
&8.D0*b2*d2*e2*g*h3*i*j*l2*n4 + &
&32.D0*b2*c*d*e*f*g*h3*i*j*l2*n4 + &
&32.D0*a*b*d2*e*f*g*h3*i*j*l2*n4 + &
&8.D0*b2*c2*f2*g*h3*i*j*l2*n4 + &
&32.D0*a*b*c*d*f2*g*h3*i*j*l2*n4 + &
&8.D0*a2*d2*f2*g*h3*i*j*l2*n4 + &
&4.D0*b2*c*d*e2*h4*i*j*l2*n4 + &
&4.D0*a*b*d2*e2*h4*i*j*l2*n4 + &
&4.D0*b2*c2*e*f*h4*i*j*l2*n4 + &
&16.D0*a*b*c*d*e*f*h4*i*j*l2*n4 + &
&4.D0*a2*d2*e*f*h4*i*j*l2*n4 + &
&4.D0*a*b*c2*f2*h4*i*j*l2*n4 + &
&4.D0*a2*c*d*f2*h4*i*j*l2*n4 + &
&b2*d2*f2*g4*j2*l2*n4 + &
&8.D0*b2*d2*e*f*g3*h*j2*l2*n4 + &
&8.D0*b2*c*d*f2*g3*h*j2*l2*n4 + &
&8.D0*a*b*d2*f2*g3*h*j2*l2*n4 + &
&6.D0*b2*d2*e2*g2*h2*j2*l2*n4 + &
&24.D0*b2*c*d*e*f*g2*h2*j2*l2*n4 + &
&24.D0*a*b*d2*e*f*g2*h2*j2*l2*n4 + &
&6.D0*b2*c2*f2*g2*h2*j2*l2*n4 + &
&24.D0*a*b*c*d*f2*g2*h2*j2*l2*n4 + &
&6.D0*a2*d2*f2*g2*h2*j2*l2*n4 + &
&8.D0*b2*c*d*e2*g*h3*j2*l2*n4 + &
&8.D0*a*b*d2*e2*g*h3*j2*l2*n4 + &
&8.D0*b2*c2*e*f*g*h3*j2*l2*n4 + &
&32.D0*a*b*c*d*e*f*g*h3*j2*l2*n4 + &
&8.D0*a2*d2*e*f*g*h3*j2*l2*n4 + &
&8.D0*a*b*c2*f2*g*h3*j2*l2*n4 + &
&8.D0*a2*c*d*f2*g*h3*j2*l2*n4 + &
&b2*c2*e2*h4*j2*l2*n4 + &
&4.D0*a*b*c*d*e2*h4*j2*l2*n4 + &
&a2*d2*e2*h4*j2*l2*n4 + &
&4.D0*a*b*c2*e*f*h4*j2*l2*n4 + &
&4.D0*a2*c*d*e*f*h4*j2*l2*n4 + &
&a2*c2*f2*h4*j2*l2*n4

IONIZ_PROBA(15)=4.D0*b2*d2*f2*h4*j2*l2*m3*n +&
&12.D0*b2*d2*f2*h4*j2*k*l*m2*n2 +&
&12.D0*b2*d2*f2*h4*i*j*l2*m2*n2 +&
&24.D0*b2*d2*f2*g*h3*j2*l2*m2*n2 +&
&12.D0*b2*d2*e*f*h4*j2*l2*m2*n2 +&
&12.D0*b2*c*d*f2*h4*j2*l2*m2*n2 +&
&12.D0*a*b*d2*f2*h4*j2*l2*m2*n2 +&
&4.D0*b2*d2*f2*h4*j2*k2*m*n3 +&
&16.D0*b2*d2*f2*h4*i*j*k*l*m*n3 +&
&32.D0*b2*d2*f2*g*h3*j2*k*l*m*n3 +&
&16.D0*b2*d2*e*f*h4*j2*k*l*m*n3 +&
&16.D0*b2*c*d*f2*h4*j2*k*l*m*n3 +&
&16.D0*a*b*d2*f2*h4*j2*k*l*m*n3 +&
&4.D0*b2*d2*f2*h4*i2*l2*m*n3 +&
&32.D0*b2*d2*f2*g*h3*i*j*l2*m*n3 +&
&16.D0*b2*d2*e*f*h4*i*j*l2*m*n3 +&
&16.D0*b2*c*d*f2*h4*i*j*l2*m*n3 +&
&16.D0*a*b*d2*f2*h4*i*j*l2*m*n3 +&
&24.D0*b2*d2*f2*g2*h2*j2*l2*m*n3 +&
&32.D0*b2*d2*e*f*g*h3*j2*l2*m*n3 +&
&32.D0*b2*c*d*f2*g*h3*j2*l2*m*n3 +&
&32.D0*a*b*d2*f2*g*h3*j2*l2*m*n3 +&
&4.D0*b2*d2*e2*h4*j2*l2*m*n3 +&
&16.D0*b2*c*d*e*f*h4*j2*l2*m*n3 +&
&16.D0*a*b*d2*e*f*h4*j2*l2*m*n3 +&
&4.D0*b2*c2*f2*h4*j2*l2*m*n3 +&
&16.D0*a*b*c*d*f2*h4*j2*l2*m*n3 +&
&4.D0*a2*d2*f2*h4*j2*l2*m*n3 +&
&2.D0*b2*d2*f2*h4*i*j*k2*n4 +&
&4.D0*b2*d2*f2*g*h3*j2*k2*n4 +&
&2.D0*b2*d2*e*f*h4*j2*k2*n4 +&
&2.D0*b2*c*d*f2*h4*j2*k2*n4 +&
&2.D0*a*b*d2*f2*h4*j2*k2*n4 +&
&2.D0*b2*d2*f2*h4*i2*k*l*n4 +&
&16.D0*b2*d2*f2*g*h3*i*j*k*l*n4 +&
&8.D0*b2*d2*e*f*h4*i*j*k*l*n4 +&
&8.D0*b2*c*d*f2*h4*i*j*k*l*n4 +&
&8.D0*a*b*d2*f2*h4*i*j*k*l*n4 +&
&12.D0*b2*d2*f2*g2*h2*j2*k*l*n4 +&
&16.D0*b2*d2*e*f*g*h3*j2*k*l*n4 +&
&16.D0*b2*c*d*f2*g*h3*j2*k*l*n4 +&
&16.D0*a*b*d2*f2*g*h3*j2*k*l*n4 +&
&2.D0*b2*d2*e2*h4*j2*k*l*n4 +&
&8.D0*b2*c*d*e*f*h4*j2*k*l*n4 +&
&8.D0*a*b*d2*e*f*h4*j2*k*l*n4 +&
&2.D0*b2*c2*f2*h4*j2*k*l*n4 +&
&8.D0*a*b*c*d*f2*h4*j2*k*l*n4 +&
&2.D0*a2*d2*f2*h4*j2*k*l*n4 +&
&4.D0*b2*d2*f2*g*h3*i2*l2*n4 +&
&2.D0*b2*d2*e*f*h4*i2*l2*n4 +&
&2.D0*b2*c*d*f2*h4*i2*l2*n4 +&
&2.D0*a*b*d2*f2*h4*i2*l2*n4 +&
&12.D0*b2*d2*f2*g2*h2*i*j*l2*n4 +&
&16.D0*b2*d2*e*f*g*h3*i*j*l2*n4 +&
&16.D0*b2*c*d*f2*g*h3*i*j*l2*n4 +&
&16.D0*a*b*d2*f2*g*h3*i*j*l2*n4 +&
&2.D0*b2*d2*e2*h4*i*j*l2*n4 +&
&8.D0*b2*c*d*e*f*h4*i*j*l2*n4 +&
&8.D0*a*b*d2*e*f*h4*i*j*l2*n4 +&
&2.D0*b2*c2*f2*h4*i*j*l2*n4 +&
&8.D0*a*b*c*d*f2*h4*i*j*l2*n4 +&
&2.D0*a2*d2*f2*h4*i*j*l2*n4 +&
&4.D0*b2*d2*f2*g3*h*j2*l2*n4 +&
&12.D0*b2*d2*e*f*g2*h2*j2*l2*n4 +&
&12.D0*b2*c*d*f2*g2*h2*j2*l2*n4 +&
&12.D0*a*b*d2*f2*g2*h2*j2*l2*n4 +&
&4.D0*b2*d2*e2*g*h3*j2*l2*n4 +&
&16.D0*b2*c*d*e*f*g*h3*j2*l2*n4 +&
&16.D0*a*b*d2*e*f*g*h3*j2*l2*n4 +&
&4.D0*b2*c2*f2*g*h3*j2*l2*n4 +&
&16.D0*a*b*c*d*f2*g*h3*j2*l2*n4 +&
&4.D0*a2*d2*f2*g*h3*j2*l2*n4 +&
&2.D0*b2*c*d*e2*h4*j2*l2*n4 +&
&2.D0*a*b*d2*e2*h4*j2*l2*n4 +&
&2.D0*b2*c2*e*f*h4*j2*l2*n4 +&
&8.D0*a*b*c*d*e*f*h4*j2*l2*n4 +&
&2.D0*a2*d2*e*f*h4*j2*l2*n4 +&
&2.D0*a*b*c2*f2*h4*j2*l2*n4 +&
&2.D0*a2*c*d*f2*h4*j2*l2*n4

IONIZ_PROBA(16)=6.D0*b2*d2*f2*h4*j2*l2*m2*n2 + &
&8.D0*b2*d2*f2*h4*j2*k*l*m*n3 + &
&8.D0*b2*d2*f2*h4*i*j*l2*m*n3 + &
&16.D0*b2*d2*f2*g*h3*j2*l2*m*n3 + &
&8.D0*b2*d2*e*f*h4*j2*l2*m*n3 + &
&8.D0*b2*c*d*f2*h4*j2*l2*m*n3 + &
&8.D0*a*b*d2*f2*h4*j2*l2*m*n3 + &
&b2*d2*f2*h4*j2*k2*n4 + &
&4.D0*b2*d2*f2*h4*i*j*k*l*n4 + &
&8.D0*b2*d2*f2*g*h3*j2*k*l*n4 + &
&4.D0*b2*d2*e*f*h4*j2*k*l*n4 + &
&4.D0*b2*c*d*f2*h4*j2*k*l*n4 + &
&4.D0*a*b*d2*f2*h4*j2*k*l*n4 + &
&b2*d2*f2*h4*i2*l2*n4 + &
&8.D0*b2*d2*f2*g*h3*i*j*l2*n4 + &
&4.D0*b2*d2*e*f*h4*i*j*l2*n4 + &
&4.D0*b2*c*d*f2*h4*i*j*l2*n4 + &
&4.D0*a*b*d2*f2*h4*i*j*l2*n4 + &
&6.D0*b2*d2*f2*g2*h2*j2*l2*n4 + &
&8.D0*b2*d2*e*f*g*h3*j2*l2*n4 + &
&8.D0*b2*c*d*f2*g*h3*j2*l2*n4 + &
&8.D0*a*b*d2*f2*g*h3*j2*l2*n4 + &
&b2*d2*e2*h4*j2*l2*n4 + &
&4.D0*b2*c*d*e*f*h4*j2*l2*n4 + &
&4.D0*a*b*d2*e*f*h4*j2*l2*n4 + &
&b2*c2*f2*h4*j2*l2*n4 + &
&4.D0*a*b*c*d*f2*h4*j2*l2*n4 + &
&a2*d2*f2*h4*j2*l2*n4

IONIZ_PROBA(17)=4.D0*b2*d2*f2*h4*j2*l2*m*n3 + &
&2.D0*b2*d2*f2*h4*j2*k*l*n4 + &
&2.D0*b2*d2*f2*h4*i*j*l2*n4 + &
&4.D0*b2*d2*f2*g*h3*j2*l2*n4 + &
&2.D0*b2*d2*e*f*h4*j2*l2*n4 + &
&2.D0*b2*c*d*f2*h4*j2*l2*n4 + &
&2.D0*a*b*d2*f2*h4*j2*l2*n4

IONIZ_PROBA(18)=b2*d2*f2*h4*j2*l2*n4

IONIZATION=IONIZ_PROBA(0)+IONIZ_PROBA(1)+IONIZ_PROBA(2)+IONIZ_PROBA(3)+&
     &IONIZ_PROBA(4)+IONIZ_PROBA(5)+IONIZ_PROBA(6)+IONIZ_PROBA(7)+&
     &IONIZ_PROBA(8)+IONIZ_PROBA(9)+IONIZ_PROBA(10)+IONIZ_PROBA(11)+&
     &+IONIZ_PROBA(12)+IONIZ_PROBA(13)+IONIZ_PROBA(14)+IONIZ_PROBA(15)+&
     &+IONIZ_PROBA(16)+IONIZ_PROBA(17)+IONIZ_PROBA(18)

OPEN(180,file='Ionization_Proba.dat',position='append')
   WRITE(180,FMT2)t,IONIZ_PROBA(0),IONIZ_PROBA(1),IONIZ_PROBA(2),IONIZ_PROBA(3)&
        &,IONIZ_PROBA(4),IONIZ_PROBA(5),IONIZ_PROBA(6),IONIZ_PROBA(7),&
        &IONIZ_PROBA(8),IONIZ_PROBA(9),IONIZ_PROBA(10),IONIZ_PROBA(11),&
        &IONIZ_PROBA(12),IONIZ_PROBA(13),IONIZ_PROBA(14),IONIZ_PROBA(15),&
        &IONIZ_PROBA(16),IONIZ_PROBA(17),IONIZ_PROBA(18)

OPEN(190,file='Ionization.dat',position='append')
WRITE(190,FMT)t,IONIZATION
  
END IF

END SUBROUTINE IONIZATION_PROBA

END MODULE IONPROBALIB
