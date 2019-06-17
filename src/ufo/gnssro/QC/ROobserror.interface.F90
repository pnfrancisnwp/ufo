!
! (C) Copyright 2017-2018 UCAR
! 
! This software is licensed under the terms of the Apache Licence Version 2.0
! which can be obtained at http://www.apache.org/licenses/LICENSE-2.0. 
!
module ufo_roobserror_mod_c

use iso_c_binding
use ufo_roobserror_mod

use ufo_geovals_mod
use ufo_geovals_mod_c,   only: ufo_geovals_registry

implicit none
private

#define LISTED_TYPE ufo_roobserror

!> Linked list interface - defines registry_t type
#include "../../linkedList_i.f"

!> Global registry
type(registry_t) :: ufo_roobserror_registry

! ------------------------------------------------------------------------------
contains
! ------------------------------------------------------------------------------
!> Linked list implementation
#include "../../linkedList_c.f"
! ------------------------------------------------------------------------------

subroutine ufo_roobserror_create_c(c_self, c_obspace, c_conf) bind(c,name='ufo_roobserror_create_f90')
implicit none
integer(c_int), intent(inout)  :: c_self
type(c_ptr), value, intent(in) :: c_obspace
type(c_ptr), value, intent(in) :: c_conf

type(ufo_roobserror), pointer :: self
 
call ufo_roobserror_registry%setup(c_self, self)
call ufo_roobserror_create(self, c_obspace, c_conf)

end subroutine ufo_roobserror_create_c

! ------------------------------------------------------------------------------

subroutine ufo_roobserror_delete_c(c_self) bind(c,name='ufo_roobserror_delete_f90')
implicit none
integer(c_int), intent(inout) :: c_self

type(ufo_roobserror), pointer :: self

call ufo_roobserror_registry%get(c_self, self)
call ufo_roobserror_delete(self)
call ufo_roobserror_registry%delete(c_self, self)

end subroutine ufo_roobserror_delete_c

! ------------------------------------------------------------------------------

subroutine ufo_roobserror_prior_c(c_self) bind(c,name='ufo_roobserror_prior_f90')
implicit none
integer(c_int), intent(in) :: c_self
type(ufo_roobserror), pointer :: self

call ufo_roobserror_registry%get(c_self, self)
call ufo_roobserror_prior(self)

end subroutine ufo_roobserror_prior_c

! ------------------------------------------------------------------------------

subroutine ufo_roobserror_post_c(c_self) bind(c,name='ufo_roobserror_post_f90')
implicit none
integer(c_int), intent(in) :: c_self

end subroutine ufo_roobserror_post_c

! ------------------------------------------------------------------------------

end module ufo_roobserror_mod_c