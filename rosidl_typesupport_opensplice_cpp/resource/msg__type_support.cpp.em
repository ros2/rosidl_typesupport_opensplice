// generated from rosidl_typesupport_opensplice_cpp/resource/msg__type_support.cpp.em
// generated code does not contain a copyright notice

@#######################################################################
@# EmPy template for generating <msg>__type_support.cpp files
@#
@# Context:
@#  - spec (rosidl_parser.MessageSpecification)
@#    Parsed specification of the .msg file
@#  - subfolder (string)
@#    The subfolder / subnamespace of the message
@#    Either 'msg', 'srv' or 'action'
@#  - get_header_filename_from_msg_name (function)
@#######################################################################
@
@# Included from rosidl_typesupport_opensplice_cpp/resource/idl__dds_opensplice__type_support.cpp.em
@{
from rosidl_cmake import convert_camel_case_to_lower_case_underscore
include_parts = [package_name] + list(interface_path.parents[0].parts)
include_dir = '/'.join(include_parts)
include_parts = include_parts.append(
    convert_camel_case_to_lower_case_underscore(interface_path.stem))
include_base = '/'.join(include_parts)
header_file = include_base +'__rosidl_typesupport_opensplice_cpp.hpp'
}@
@[if header_file in include_directives]@
// already included above
// @
@[else]@
@{include_directives.add(header_file)}@
@[end if]@
#include "@(header_file)"

#include <limits>
#include <stdexcept>

#include <u_instanceHandle.h>
#include <CdrTypeSupport.h>

#include "rosidl_typesupport_cpp/message_type_support.hpp"

@{
header_files = [
  include_base + '__struct.hpp',
  include_dir + '/dds_opensplice/ccpp_' + message.structure.type.name + '_.h',
  'rosidl_typesupport_opensplice_cpp/identifier.hpp'
  'rosidl_typesupport_opensplice_cpp/message_type_support.h'
  'rosidl_typesupport_opensplice_cpp/message_type_support_decl.hpp'
  'rosidl_typesupport_opensplice_cpp/u__instanceHandle.h'
  'rmw/rmw.h'
]
}@
@[for header_file in header_files]@
@[    if header_file in include_directives]@
// already included above
// @
@[    else]@
@{include_directives.add(header_file)}@
@[    end if]@
#include "@(header_file)"
@[end for]@

@{
__ros_msg_pkg_prefix = '::'.join(message.structure.type.namespaces)
__ros_msg_type_prefix = __ros_msg_pkg_prefix + '::' + message.structure.type.name
__dds_msg_type_prefix = __ros_msg_pkg_prefix + '::dds_::' +  message.structure.type.name + '_'
}@

// forward declaration of message dependencies and their conversion functions
@[for member in message.structure.members]@
@[    if isinstance(member.type, NamespacedType)]@
@[        for ns in member.type.namespaces]@
namespace @(ns)
{
@[        end for]@
namespace dds_
{
struct @(member.type.name)_;
}  // namespace dds_
namespace typesupport_opensplice_cpp
{
void convert_ros_message_to_dds(
  const @(__ros_msg_type_prefix) &,
  dds_::@(__dds_msg_type_prefix) &);
void convert_dds_message_to_ros(
  const dds_::@(__dds_msg_type_prefix) &,
  @(__ros_msg_type_prefix) &);
}  // namespace typesupport_opensplice_cpp
@[        for ns in reversed(member.type.namespaces)]@
}  // namespace @(ns)
@[        end for]@
@[    end if]@
@[end for]@

@[for ns in message.structure.type.namespaces]@
namespace @(ns)
{
@[end for]@

namespace typesupport_opensplice_cpp
{

@{
__dds_msg_type_prefix = "{}::{}::dds_::{}_".format(
  spec.base_type.pkg_name, subfolder, spec.base_type.type)
}@
using __dds_msg_type = @(__dds_msg_type_prefix);
using __ros_msg_type = @(__ros_msg_type_prefix);

static @(__dds_msg_type_prefix)TypeSupport __type_support;

ROSIDL_TYPESUPPORT_OPENSPLICE_CPP_EXPORT_@(package_name)
const char *
register_type__@(message.structure.type.name)(
  void * untyped_participant,
  const char * type_name)
{
  if (!untyped_participant) {
    return "untyped participant handle is null";
  }
  if (!type_name) {
    return "type name handle is null";
  }
  DDS::DomainParticipant * participant =
    static_cast<DDS::DomainParticipant *>(untyped_participant);

  DDS::ReturnCode_t status = __type_support.register_type(participant, type_name);
  switch (status) {
    case DDS::RETCODE_ERROR:
      return "@(__dds_msg_type_prefix)TypeSupport.register_type: "
             "an internal error has occurred";
    case DDS::RETCODE_BAD_PARAMETER:
      return "@(__dds_msg_type_prefix)TypeSupport.register_type: "
             "bad domain participant or type name parameter";
    case DDS::RETCODE_OUT_OF_RESOURCES:
      return "@(__dds_msg_type_prefix)TypeSupport.register_type: "
             "out of resources";
    case DDS::RETCODE_PRECONDITION_NOT_MET:
      return "@(__dds_msg_type_prefix)TypeSupport.register_type: "
             "already registered with a different TypeSupport class";
    case DDS::RETCODE_OK:
      return nullptr;
    default:
      return "@(__dds_msg_type_prefix)TypeSupport.register_type: unknown return code";
  }
}

ROSIDL_TYPESUPPORT_OPENSPLICE_CPP_EXPORT_@(package_name)
void
convert_ros_message_to_dds(const __ros_msg_type & ros_message, __dds_msg_type & dds_message)
{
@[if not spec.fields]@
  (void)ros_message;
  (void)dds_message;
@[end if]@
@[for field in spec.fields]@
  // field.name @(field.name)
@[  if field.type.is_array]@
  {
@[    if field.type.array_size and not field.type.is_upper_bound]@
    size_t size = @(field.type.array_size);
@[    else]@
    size_t size = ros_message.@(field.name).size();
    if (size > (std::numeric_limits<DDS::Long>::max)()) {
      throw std::runtime_error("array size exceeds maximum DDS sequence size");
    }
    DDS::Long length = static_cast<DDS::Long>(size);
    dds_message.@(field.name)_.length(length);
@[    end if]@
    for (DDS::ULong i = 0; i < size; i++) {
@[    if field.type.type == 'string']@
      dds_message.@(field.name)_[i] = ros_message.@(field.name)[i].c_str();
@[    elif field.type.type == 'bool']@
      dds_message.@(field.name)_[i] = 1 ? ros_message.@(field.name)[i] : 0;
@[    elif field.type.is_primitive_type()]@
      dds_message.@(field.name)_[i] = ros_message.@(field.name)[i];
@[    else]@
      @(field.type.pkg_name)::msg::typesupport_opensplice_cpp::convert_ros_message_to_dds(
        ros_message.@(field.name)[i], dds_message.@(field.name)_[i]);
@[    end if]@
    }
  }
@[  elif field.type.type == 'string']@
  dds_message.@(field.name)_ = ros_message.@(field.name).c_str();
@[  elif field.type.is_primitive_type()]@
  dds_message.@(field.name)_ = ros_message.@(field.name);
@[  else]@
  @(field.type.pkg_name)::msg::typesupport_opensplice_cpp::convert_ros_message_to_dds(
    ros_message.@(field.name), dds_message.@(field.name)_);
@[  end if]@
@[end for]@
}

ROSIDL_TYPESUPPORT_OPENSPLICE_CPP_EXPORT_@(package_name)
const char *
publish__@(message.structure.type.name)(
  void * untyped_topic_writer,
  const void * untyped_ros_message)
{
  DDS::DataWriter * topic_writer = static_cast<DDS::DataWriter *>(untyped_topic_writer);

  const __ros_msg_type & ros_message = *static_cast<const __ros_msg_type *>(untyped_ros_message);
  __dds_msg_type dds_message;
  convert_ros_message_to_dds(ros_message, dds_message);

  @(__dds_msg_type_prefix)DataWriter * data_writer =
    @(__dds_msg_type_prefix)DataWriter::_narrow(topic_writer);
  DDS::ReturnCode_t status = data_writer->write(dds_message, DDS::HANDLE_NIL);
  switch (status) {
    case DDS::RETCODE_ERROR:
      return "@(__dds_msg_type_prefix)DataWriter.write: "
             "an internal error has occurred";
    case DDS::RETCODE_BAD_PARAMETER:
      return "@(__dds_msg_type_prefix)DataWriter.write: "
             "bad handle or instance_data parameter";
    case DDS::RETCODE_ALREADY_DELETED:
      return "@(__dds_msg_type_prefix)DataWriter.write: "
             "this @(__dds_msg_type_prefix)DataWriter has already been deleted";
    case DDS::RETCODE_OUT_OF_RESOURCES:
      return "@(__dds_msg_type_prefix)DataWriter.write: "
             "out of resources";
    case DDS::RETCODE_NOT_ENABLED:
      return "@(__dds_msg_type_prefix)DataWriter.write: "
             "this @(__dds_msg_type_prefix)DataWriter is not enabled";
    case DDS::RETCODE_PRECONDITION_NOT_MET:
      return "@(__dds_msg_type_prefix)DataWriter.write: "
             "the handle has not been registered with this @(__dds_msg_type_prefix)DataWriter";
    case DDS::RETCODE_TIMEOUT:
      return "@(__dds_msg_type_prefix)DataWriter.write: "
             "writing resulted in blocking and then exceeded the timeout set by the "
             "max_blocking_time of the ReliabilityQosPolicy";
    case DDS::RETCODE_OK:
      return nullptr;
    default:
      return "@(__dds_msg_type_prefix)DataWriter.write: unknown return code";
  }
}

ROSIDL_TYPESUPPORT_OPENSPLICE_CPP_EXPORT_@(package_name)
void
convert_dds_message_to_ros(const __dds_msg_type & dds_message, __ros_msg_type & ros_message)
{
@[if not spec.fields]@
  (void)ros_message;
  (void)dds_message;
@[end if]@
@[for field in spec.fields]@
  // field.name @(field.name)
@[  if field.type.is_array]@
  {
@[    if field.type.array_size and not field.type.is_upper_bound]@
    size_t size = @(field.type.array_size);
@[    else]@
    size_t size = dds_message.@(field.name)_.length();
    ros_message.@(field.name).resize(size);
@[    end if]@
    for (DDS::ULong i = 0; i < size; i++) {
@[    if field.type.type == 'bool']@
      ros_message.@(field.name)[i] = (dds_message.@(field.name)_[i] != 0);
@[    elif field.type.is_primitive_type()]@
      ros_message.@(field.name)[i] =
        dds_message.@(field.name)_[i];
@[    else]@
      @(field.type.pkg_name)::msg::typesupport_opensplice_cpp::convert_dds_message_to_ros(
        dds_message.@(field.name)_[i], ros_message.@(field.name)[i]);
@[    end if]@
    }
  }
@[  elif field.type.is_primitive_type()]@
  ros_message.@(field.name) =
    @('(' if field.type.type == 'bool' else '')dds_message.@(field.name)_@(' != 0)' if field.type.type == 'bool' else '');
@[  else]@
  @(field.type.pkg_name)::msg::typesupport_opensplice_cpp::convert_dds_message_to_ros(
    dds_message.@(field.name)_, ros_message.@(field.name));
@[  end if]@
@[end for]@
}

ROSIDL_TYPESUPPORT_OPENSPLICE_CPP_EXPORT_@(package_name)
const char *
take__@(message.structure.type.name)(
  void * untyped_topic_reader,
  bool ignore_local_publications,
  void * untyped_ros_message,
  bool * taken,
  void * sending_publication_handle)
{
  if (untyped_ros_message == 0) {
    return "invalid ros message pointer";
  }

  DDS::DataReader * topic_reader = static_cast<DDS::DataReader *>(untyped_topic_reader);

  @(__dds_msg_type_prefix)DataReader * data_reader =
    @(__dds_msg_type_prefix)DataReader::_narrow(topic_reader);

  @(__dds_msg_type_prefix)Seq dds_messages;
  DDS::SampleInfoSeq sample_infos;
  DDS::ReturnCode_t status = data_reader->take(
    dds_messages,
    sample_infos,
    1,
    DDS::ANY_SAMPLE_STATE,
    DDS::ANY_VIEW_STATE,
    DDS::ANY_INSTANCE_STATE);

  const char * errs = nullptr;
  bool ignore_sample = false;

  switch (status) {
    case DDS::RETCODE_ERROR:
      errs = "@(__dds_msg_type_prefix)DataReader.take: "
        "an internal error has occurred";
      goto finally;
    case DDS::RETCODE_ALREADY_DELETED:
      errs = "@(__dds_msg_type_prefix)DataReader.take: "
        "this @(__dds_msg_type_prefix)DataReader has already been deleted";
      goto finally;
    case DDS::RETCODE_OUT_OF_RESOURCES:
      errs = "@(__dds_msg_type_prefix)DataReader.take: "
        "out of resources";
      goto finally;
    case DDS::RETCODE_NOT_ENABLED:
      errs = "@(__dds_msg_type_prefix)DataReader.take: "
        "this @(__dds_msg_type_prefix)DataReader is not enabled";
      goto finally;
    case DDS::RETCODE_PRECONDITION_NOT_MET:
      errs = "@(__dds_msg_type_prefix)DataReader.take: "
        "a precondition is not met, one of: "
        "max_samples > maximum and max_samples != LENGTH_UNLIMITED, or "
        "the two sequences do not have matching parameters (length, maximum, release), or "
        "maximum > 0 and release is false.";
      goto finally;
    case DDS::RETCODE_NO_DATA:
      *taken = false;
      errs = nullptr;
      goto finally;
    case DDS::RETCODE_OK:
      break;
    default:
      errs = "@(__dds_msg_type_prefix)DataReader.take: unknown return code";
      goto finally;
  }

  {
    DDS::SampleInfo & sample_info = sample_infos[0];
    if (!sample_info.valid_data) {
      // skip sample without data
      ignore_sample = true;
    } else {
      DDS::InstanceHandle_t sender_handle = sample_info.publication_handle;
      auto sender_gid = u_instanceHandleToGID(sender_handle);
      if (ignore_local_publications) {
        // compare the system id from the sender and this receiver
        // if they are equal the sample has been sent from this process and should be ignored
        DDS::InstanceHandle_t receiver_handle = topic_reader->get_instance_handle();
        auto receiver_gid = u_instanceHandleToGID(receiver_handle);
        ignore_sample = sender_gid.systemId == receiver_gid.systemId;
      }
      // This is nullptr when being used with plain rmw_take, so check first.
      if (sending_publication_handle) {
        *static_cast<DDS::InstanceHandle_t *>(sending_publication_handle) = sender_handle;
      }
    }
  }

  if (!ignore_sample) {
    __ros_msg_type & ros_message = *static_cast<__ros_msg_type *>(untyped_ros_message);
    convert_dds_message_to_ros(dds_messages[0], ros_message);
    *taken = true;
  } else {
    *taken = false;
  }

finally:
  // Ensure the loan is returned.
  status = data_reader->return_loan(dds_messages, sample_infos);
  switch (status) {
    case DDS::RETCODE_ERROR:
      return "@(__dds_msg_type_prefix)DataReader.return_loan: "
             "an internal error has occurred";
    case DDS::RETCODE_ALREADY_DELETED:
      return "@(__dds_msg_type_prefix)DataReader.return_loan: "
             "this @(__dds_msg_type_prefix)DataReader has already been deleted";
    case DDS::RETCODE_OUT_OF_RESOURCES:
      return "@(__dds_msg_type_prefix)DataReader.return_loan: "
             "out of resources";
    case DDS::RETCODE_NOT_ENABLED:
      return "@(__dds_msg_type_prefix)DataReader.return_loan: "
             "this @(__dds_msg_type_prefix)DataReader is not enabled";
    case DDS::RETCODE_PRECONDITION_NOT_MET:
      return "@(__dds_msg_type_prefix)DataReader.return_loan: "
             "a precondition is not met, one of: "
             "the data_values and info_seq do not belong to a single related pair, or "
             "the data_values and info_seq were not obtained from this "
             "@(__dds_msg_type_prefix)DataReader";
    case DDS::RETCODE_OK:
      break;
    default:
      return "@(__dds_msg_type_prefix)DataReader.return_loan failed with "
             "unknown return code";
  }

  return errs;
}

ROSIDL_TYPESUPPORT_OPENSPLICE_CPP_EXPORT_@(package_name)
const char *
serialize__@(message.structure.type.name)(
  const void * untyped_ros_message,
  void * untyped_serialized_data)
{
  const __ros_msg_type & ros_message = *static_cast<const __ros_msg_type *>(untyped_ros_message);
  __dds_msg_type dds_message;

  convert_ros_message_to_dds(ros_message, dds_message);

  DDS::OpenSplice::CdrTypeSupport cdr_ts(__type_support);
  DDS::OpenSplice::CdrSerializedData * serdata = nullptr;

  DDS::ReturnCode_t status = cdr_ts.serialize(&dds_message, &serdata);
  switch (status) {
    case DDS::RETCODE_ERROR:
      return "@(__dds_msg_type_prefix)TypeSupport.serialize: "
             "an internal error has occurred";
    case DDS::RETCODE_BAD_PARAMETER:
      return "@(__dds_msg_type_prefix)TypeSupport.serialize: "
             "bad parameter";
    case DDS::RETCODE_ALREADY_DELETED:
      return "@(__dds_msg_type_prefix)TypeSupport.serialize: "
             "this @(__dds_msg_type_prefix)TypeSupport has already been deleted";
    case DDS::RETCODE_OUT_OF_RESOURCES:
      return "@(__dds_msg_type_prefix)TypeSupport.serialize: "
             "out of resources";
    case DDS::RETCODE_OK:
      break;
    default:
      return "@(__dds_msg_type_prefix)TypeSupport.serialize failed with "
             "unknown return code";
  }

  rmw_serialized_message_t * serialized_data =
    static_cast<rmw_serialized_message_t *>(untyped_serialized_data);

  auto data_length = serdata->get_size();

  if (serialized_data->buffer_capacity < data_length) {
    if (rmw_serialized_message_resize(serialized_data, data_length) == RMW_RET_OK) {
      serialized_data->buffer_capacity = data_length;
    } else {
      delete serdata;
      return "@(__dds_msg_type_prefix)TypeSupport.serialize: "
             "unable to dynamically resize serialized message";
    }
  }

  serialized_data->buffer_length = data_length;
  serdata->get_data(serialized_data->buffer);

  delete serdata;

  return nullptr;
}

ROSIDL_TYPESUPPORT_OPENSPLICE_CPP_EXPORT_@(package_name)
const char *
deserialize__@(message.structure.type.name)(
  const uint8_t * buffer,
  unsigned length,
  void * untyped_ros_message)
{
  __dds_msg_type dds_message;

  DDS::OpenSplice::CdrTypeSupport cdr_ts(__type_support);

  DDS::ReturnCode_t status = cdr_ts.deserialize(buffer, length, &dds_message);

  switch (status) {
    case DDS::RETCODE_ERROR:
      return "@(__dds_msg_type_prefix)TypeSupport.deserialize: "
             "an internal error has occurred";
    case DDS::RETCODE_BAD_PARAMETER:
      return "@(__dds_msg_type_prefix)TypeSupport.deserialize: "
             "bad parameter";
    case DDS::RETCODE_ALREADY_DELETED:
      return "@(__dds_msg_type_prefix)TypeSupport.deserialize: "
             "this @(__dds_msg_type_prefix)TypeSupport has already been deleted";
    case DDS::RETCODE_OUT_OF_RESOURCES:
      return "@(__dds_msg_type_prefix)TypeSupport.deserialize: "
             "out of resources";
    case DDS::RETCODE_OK:
      break;
    default:
      return "@(__dds_msg_type_prefix)TypeSupport.deserialize failed with "
             "unknown return code";
  }

  __ros_msg_type & ros_message = *static_cast<__ros_msg_type *>(untyped_ros_message);
  convert_dds_message_to_ros(dds_message, ros_message);

  return nullptr;
}

static message_type_support_callbacks_t callbacks = {
  "@(package_name)",
  "@(message.structure.type.name)",
  &register_type__@(message.structure.type.name),
  &publish__@(message.structure.type.name),
  &take__@(message.structure.type.name),
  &serialize__@(message.structure.type.name),
  &deserialize__@(message.structure.type.name),
  nullptr,  // convert ros to dds (handled differently for C++)
  nullptr,  // convert dds to ros (handled differently for C++)
};

static rosidl_message_type_support_t handle = {
  rosidl_typesupport_opensplice_cpp::typesupport_identifier,
  &callbacks,
  get_message_typesupport_handle_function,
};

}  // namespace typesupport_opensplice_cpp

@[for ns in reversed(message.structure.type.namespaces)]@
}  // namespace @(ns)
@[end for]@

namespace rosidl_typesupport_opensplice_cpp
{

template<>
ROSIDL_TYPESUPPORT_OPENSPLICE_CPP_EXPORT_@(package_name)
const rosidl_message_type_support_t *
get_message_type_support_handle<@(__ros_msg_type_prefix)>()
{
  return &@(__ros_msg_pkg_prefix)::typesupport_opensplice_cpp::handle;
}

}  // namespace rosidl_typesupport_opensplice_cpp

#ifdef __cplusplus
extern "C"
{
#endif

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(
  rosidl_typesupport_opensplice_cpp,
  @(', '.join([package_name] + list(interface_path.parents[0].parts))),
  @(message.structure.type.name))()
{
  return &@(__ros_msg_pkg_prefix)::typesupport_opensplice_cpp::handle;
}

#ifdef __cplusplus
}
#endif
