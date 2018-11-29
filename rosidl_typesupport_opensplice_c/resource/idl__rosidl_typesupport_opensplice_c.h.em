// generated from rosidl_typesupport_opensplice_c/resource/idl__rosidl_typesupport_c.h.em
// generated code does not contain a copyright notice

@{
#######################################################################
# EmPy template for generating <idl>__rosidl_typesupport_c.h files
#
# Context:
#  - package_name (string)
#  - content (rosidl_parser.definition.IdlContent result of parsing IDL file)
#  - interface_path (Path relative to the directory named after the package)
#######################################################################

include_directives = set()

#######################################################################
# Handle message
#######################################################################
from rosidl_parser.definition import Message
for message in content.get_elements_of_type(Message):
    TEMPLATE(
        'msg__rosidl_typesupport_opensplice_c.h.em',
        package_name=package_name, interface_path=interface_path, message=message,
        include_directives=include_directives)

#######################################################################
# Handle service
#######################################################################
from rosidl_parser.definition import Service
for service in content.get_elements_of_type(Service):
    TEMPLATE(
        'srv__rosidl_typesupport_opensplice_c.h.em',
        package_name=package_name, interface_path=interface_path, service=service,
        include_directives=include_directives)

#######################################################################
# Handle action
#######################################################################
from rosidl_parser.definition import Action
for action in content.get_elements_of_type(Action):
    TEMPLATE(
        'srv__rosidl_typesupport_opensplice_c.h.em',
        package_name=package_name, interface_path=interface_path, service=action.goal_service,
        include_directives=include_directives)
    TEMPLATE(
        'srv__rosidl_typesupport_opensplice_c.h.em',
        package_name=package_name, interface_path=interface_path, service=action.result_service,
        include_directives=include_directives)
    TEMPLATE(
        'msg__rosidl_typesupport_opensplice_c.h.em',
        package_name=package_name, interface_path=interface_path, message=action.feedback,
        include_directives=include_directives)
}@
