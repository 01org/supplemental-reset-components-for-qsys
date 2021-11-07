#
# Copyright (c) 2016-2021 Intel Corporation
#
# SPDX-License-Identifier: MIT-0
#
package require -exact qsys 15.1


#
# module emif_status_breakout
#
set_module_property DESCRIPTION "Breakout the EMIF status conduit bundle into more useful interfaces."
set_module_property NAME emif_status_breakout
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "Reset Components/Adapters"
set_module_property AUTHOR RSF
set_module_property DISPLAY_NAME emif_status_breakout
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE false
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


#
# file sets
#


#
# parameters
#


#
# display items
#


#
# connection point status
#
add_interface status conduit end
set_interface_property status associatedClock ""
set_interface_property status associatedReset ""
set_interface_property status ENABLED true
set_interface_property status EXPORT_OF ""
set_interface_property status PORT_NAME_MAP ""
set_interface_property status CMSIS_SVD_VARIABLES ""
set_interface_property status SVD_ADDRESS_GROUP ""

add_interface_port status local_cal_fail local_cal_fail Input 1
add_interface_port status local_cal_success local_cal_success Input 1
add_interface_port status local_init_done local_init_done Input 1


#
# connection point cal_fail
#
add_interface cal_fail reset start
set_interface_property cal_fail associatedClock ""
set_interface_property cal_fail associatedDirectReset ""
set_interface_property cal_fail associatedResetSinks ""
set_interface_property cal_fail synchronousEdges NONE
set_interface_property cal_fail ENABLED true
set_interface_property cal_fail EXPORT_OF ""
set_interface_property cal_fail PORT_NAME_MAP ""
set_interface_property cal_fail CMSIS_SVD_VARIABLES ""
set_interface_property cal_fail SVD_ADDRESS_GROUP ""

add_interface_port cal_fail cal_fail reset Output 1
set_port_property cal_fail DRIVEN_BY local_cal_fail


#
# connection point cal_success
#
add_interface cal_success conduit end
set_interface_property cal_success associatedClock ""
set_interface_property cal_success associatedReset ""
set_interface_property cal_success ENABLED true
set_interface_property cal_success EXPORT_OF ""
set_interface_property cal_success PORT_NAME_MAP ""
set_interface_property cal_success CMSIS_SVD_VARIABLES ""
set_interface_property cal_success SVD_ADDRESS_GROUP ""

add_interface_port cal_success cal_success event_input Output 1
set_port_property cal_success DRIVEN_BY local_cal_success


#
# connection point init_done
#
add_interface init_done conduit end
set_interface_property init_done associatedClock ""
set_interface_property init_done associatedReset ""
set_interface_property init_done ENABLED true
set_interface_property init_done EXPORT_OF ""
set_interface_property init_done PORT_NAME_MAP ""
set_interface_property init_done CMSIS_SVD_VARIABLES ""
set_interface_property init_done SVD_ADDRESS_GROUP ""

add_interface_port init_done init_done event_input Output 1
set_port_property init_done DRIVEN_BY local_init_done

