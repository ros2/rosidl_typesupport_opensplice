// generated from rosidl_typesupport_opensplice_c/resource/msg__type_support_c.cpp.em
// generated code does not contain a copyright notice

@# Included from rosidl_typesupport_opensplice_c/resource/idl__dds_opensplice_type_support.c.em
@{
from rosidl_cmake import convert_camel_case_to_lower_case_underscore
from rosidl_parser.definition import Array
from rosidl_parser.definition import BasicType
from rosidl_parser.definition import BaseString
from rosidl_parser.definition import NamespacedType
from rosidl_parser.definition import NestedType
from rosidl_parser.definition import String
from rosidl_parser.definition import WString
include_parts = [package_name] + list(interface_path.parents[0].parts)
include_dir = '/'.join(include_parts)
include_parts.append(convert_camel_case_to_lower_case_underscore(interface_path.stem))
include_base = '/'.join(include_parts)
header_file = include_base + '__rosidl_typesupport_opensplice_c.h'
}@
@{
header_files = [
    header_file,
    'rosidl_typesupport_opensplice_c/identifier.h',
    package_name + '/msg/rosidl_generator_c__visibility_control.h',
    'rosidl_typesupport_opensplice_cpp/message_type_support.h',
    'rosidl_typesupport_opensplice_cpp/u__instanceHandle.h',
    'rmw/rmw.h',
    package_name + '/msg/rosidl_typesupport_opensplice_c__visibility_control.h',
    include_base + '.h',
    include_dir + '/dds_opensplice/ccpp_' + interface_path.stem + '_.h',
]
}@
@[for header_file in header_files]@
@[  if header_file in include_directives]@
// already included above
// @
@[  else]@
@{include_directives.add(header_file)}@
@[  end if]@
#include "@(header_file)"
@[end for]@

// includes and forward declarations of message dependencies and their conversion functions
@# // Include the message header for each non-primitive field.
#if defined(__cplusplus)
extern "C"
{
#endif

// include message dependencies
@{
includes = {}
for member in message.structure.members:
    keys = set([])
    if isinstance(member.type, NestedType):
        if isinstance(member.type.basetype, BasicType):
            keys.add('rosidl_generator_c/primitives_sequence.h')
            keys.add('rosidl_generator_c/primitives_sequence_functions.h')
        elif isinstance(member.type.basetype, String):
            keys.add('rosidl_generator_c/string.h')
            keys.add('rosidl_generator_c/string_functions.h')
        elif isinstance(member.type.basetype, WString):
            keys.add('rosidl_generator_c/u16string.h')
            keys.add('rosidl_generator_c/u16string_functions.h')
        elif isinstance(member.type.basetype, NamespacedType):
            header_file_name = convert_camel_case_to_lower_case_underscore(member.type.basetype.name)
            keys.add('%s/%s.h' % ('/'.join(member.type.basetype.namespaces), header_file_name))
    elif isinstance(member.type, String):
        keys.add('rosidl_generator_c/string.h')
        keys.add('rosidl_generator_c/string_functions.h')
    elif isinstance(member.type, WString):
        keys.add('rosidl_generator_c/u16string.h')
        keys.add('rosidl_generator_c/u16string_functions.h')
    for key in keys:
        if key not in includes:
            includes[key] = set([])
        includes[key].add(member.name)
}@
@[for key in sorted(includes.keys())]@
@[  if key in include_directives]@
// already included above
// @
@[  else]@
@{include_directives.add(key)}@
@[  end if]@
#include "@(key)"  // @(', '.join(includes[key]))
@[end for]@

// forward declare type support functions
@{
forward_declares = {}
for member in message.structure.members:
    _type = member.type
    if isinstance(_type, NestedType):
       _type = member.type.basetype

    if isinstance(_type, NamespacedType):
        key = (', '.join(_type.namespaces), _type.name)
        if key not in includes:
            forward_declares[key] = set([])
        forward_declares[key].add(member.name)
}@
@[for key in sorted(forward_declares.keys())]@
@[  if key[0] != package_name]@
ROSIDL_TYPESUPPORT_OPENSPLICE_C_IMPORT_@(package_name)
@[  end if]@
const rosidl_message_type_support_t *
  ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(
  rosidl_typesupport_opensplice_c, @(key[0]), @(key[1]))();
@[end for]@

@# // Make callback functions specific to this message type.
@{
__dds_msg_type_prefix = '::'.join(message.structure.type.namespaces + ['dds_'] + [message.structure.type.name]) + '_'
__ros_msg_type_prefix = '__'.join(message.structure.type.namespaces + [message.structure.type.name])
__static_suffix = '__'.join(message.structure.type.namespaces + [message.structure.type.name])
}@
using __dds_msg_type_@(__static_suffix) = @(__dds_msg_type_prefix);
using __ros_msg_type_@(__static_suffix) = @(__ros_msg_type_prefix);

static @(__dds_msg_type_prefix)TypeSupport _type_support_@(__static_suffix);

static const char *
register_type_@(__static_suffix)(void * untyped_participant, const char * type_name)
{
  if (!untyped_participant) {
    return "untyped participant handle is null";
  }
  if (!type_name) {
    return "type name handle is null";
  }
  using DDS::DomainParticipant;
  DomainParticipant * participant = static_cast<DomainParticipant *>(untyped_participant);

  DDS::ReturnCode_t status = _type_support_@(__static_suffix).register_type(participant, type_name);
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

static const char *
convert_ros_to_dds_@(__static_suffix)(const void * untyped_ros_message, void * untyped_dds_message)
{
  if (!untyped_ros_message) {
    return "ros message handle is null";
  }
  if (!untyped_dds_message) {
    return "dds message handle is null";
  }
  const __ros_msg_type_@(__static_suffix) * ros_message = static_cast<const __ros_msg_type_@(__static_suffix) *>(untyped_ros_message);
  __dds_msg_type_@(__static_suffix) * dds_message = static_cast<__dds_msg_type_@(__static_suffix) *>(untyped_dds_message);
@[if not message.structure.members]@
  (void)dds_message;
  (void)ros_message;
  return 0;  // No fields is a no-op.
@[end if]@
@[for member in message.structure.members]@
  // Field name: @(member.name)
  {
@[  if isinstance(member.type, NamespacedType)]@
    const message_type_support_callbacks_t * @('__'.join(member.type.namespaces + [member.type.name] + ['callbacks'])) =
      static_cast<const message_type_support_callbacks_t *>(
      ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(
        rosidl_typesupport_opensplice_c,
        @(', '.join(member.type.namespaces)), @(member.type.name)
      )()->data);
@[  end if]@
@[  if isinstance(member.type, NestedType)]@
@[    if isinstance(member.type.basetype, NamespacedType)]@
    const message_type_support_callbacks_t * @('__'.join(member.type.basetype.namespaces + [member.type.basetype.name] + ['callbacks'])) =
      static_cast<const message_type_support_callbacks_t *>(
      ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(
        rosidl_typesupport_opensplice_c,
        @(', '.join(member.type.basetype.namespaces)), @(member.type.basetype.name)
      )()->data);
@[    end if]@
@[    if isinstance(member.type, Array)]@
    size_t size = @(member.type.size);
@[    else]@
    size_t size = ros_message->@(member.name).size;
    if (size > (std::numeric_limits<DDS::Long>::max)()) {
      return "array size exceeds maximum DDS sequence size";
    }
    DDS::Long length = static_cast<DDS::Long>(size);
    dds_message->@(member.name)_.length(length);
@[    end if]@
    for (DDS::ULong i = 0; i < size; ++i) {
@[    if isinstance(member.type, Array)]@
      auto & ros_i = ros_message->@(member.name)[i];
@[    else]@
      auto & ros_i = ros_message->@(member.name).data[i];
@[    end if]@
@[    if isinstance(member.type.basetype, BaseString)]@
@[      if isinstance(member.type.basetype, WString)]@
      const rosidl_generator_c__U16String * str = &ros_i;
@[       else]@
      const rosidl_generator_c__String * str = &ros_i;
@[       end if]@
      if (!str) {
        return "string field was not allocated";
      }
      if (str->capacity == 0 || str->capacity <= str->size) {
        return "string capacity not greater than size";
      }
      if (!str->data) {
        return "string data was not allocated";
      }
      if (str->data[str->size] != '\0') {
        return "string not null-terminated";
      }

      dds_message->@(member.name)_[i] = DDS::string_dup(str->data);
@[    elif isinstance(member.type.basetype, BasicType)]@
@[      if member.type.basetype.type == 'boolean']@
      dds_message->@(member.name)_[i] = 1 ? ros_i : 0;
@[      else]@
      dds_message->@(member.name)_[i] = ros_i;
@[      end if]@
@[    else]@
      const char * err_msg = @('__'.join(member.type.basetype.namespaces + [member.type.basetype.name] + ['callbacks']))->convert_ros_to_dds(
        &ros_i, &dds_message->@(member.name)_[i]);
      if (err_msg != 0) {
        return err_msg;
      }
@[    end if]@
    }
@[  elif isinstance(member.type, BaseString)]@
@[    if isinstance(member.type, WString)]@
    const rosidl_generator_c__U16String * str = &ros_message->@(member.name);
@[    else]@
    const rosidl_generator_c__String * str = &ros_message->@(member.name);
@[    end if]@
    if (!str) {
      return "string field was not allocated";
    }
    if (str->capacity == 0 || str->capacity <= str->size) {
      return "string capacity not greater than size";
    }
    if (!str->data) {
      return "string data was not allocated";
    }
    if (str->data[str->size] != '\0') {
      return "string not null-terminated";
    }

    dds_message->@(member.name)_ = DDS::string_dup(str->data);
@[  elif isinstance(member.type, BasicType)]@
    dds_message->@(member.name)_ = ros_message->@(member.name);
@[  else]@
    const char * err_msg = @('__'.join(member.type.namespaces + [member.type.name] + ['callbacks']))->convert_ros_to_dds(
      &ros_message->@(member.name), &dds_message->@(member.name)_);
    if (err_msg != 0) {
      return err_msg;
    }
@[  end if]@
  }

@[end for]@
  return 0;
}

static const char *
publish_@(__static_suffix)(void * dds_data_writer, const void * ros_message)
{
  if (!dds_data_writer) {
    return "data writer handle is null";
  }
  if (!ros_message) {
    return "ros message handle is null";
  }

  DDS::DataWriter * topic_writer = static_cast<DDS::DataWriter *>(dds_data_writer);

  __dds_msg_type_@(__static_suffix) dds_message;
  const char * err_msg = convert_ros_to_dds_@(__static_suffix)(ros_message, &dds_message);
  if (err_msg != 0) {
    return err_msg;
  }

  @(__dds_msg_type_prefix)DataWriter * data_writer =
    @(__dds_msg_type_prefix)DataWriter::_narrow(topic_writer);
  DDS::ReturnCode_t status = data_writer->write(dds_message, DDS::HANDLE_NIL);
@[for member in message.structure.members]@
@[  if isinstance(member.type, NestedType)]@
@[    if isinstance(member.type.basetype, BaseString)]@
  {
@[      if isinstance(member.type, Array)]@
    size_t size = @(member.type.size);
@[      else]@
    size_t size = dds_message.@(member.name)_.length();
@[      end if]@
    for (DDS::ULong i = 0; i < size; ++i) {
      // This causes the DDS::String_mgr to release the given c string without freeing it.
      dds_message.@(member.name)_[i]._retn();
    }
  }
@[    end if]@
@[  elif isinstance(member.type, BaseString)]@
  // This causes the DDS::String_mgr to release the given c string without freeing it.
  dds_message.@(member.name)_._retn();
@[  end if]@
@[end for]@
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

static const char *
convert_dds_to_ros_@(__static_suffix)(const void * untyped_dds_message, void * untyped_ros_message)
{
  if (!untyped_ros_message) {
    return "ros message handle is null";
  }
  if (!untyped_dds_message) {
    return "dds message handle is null";
  }
  const __dds_msg_type_@(__static_suffix) * dds_message = static_cast<const __dds_msg_type_@(__static_suffix) *>(untyped_dds_message);
  __ros_msg_type_@(__static_suffix) * ros_message = static_cast<__ros_msg_type_@(__static_suffix) *>(untyped_ros_message);
@[if not message.structure.members]@
  (void)dds_message;
  (void)ros_message;
  return 0;  // No fields is a no-op.
@[end if]@
@[for member in message.structure.members]@
  // Field name: @(member.name)
  {
@[  if isinstance(member.type, NestedType)]@
@[    if isinstance(member.type, Array)]@
    size_t size = @(member.type.size);
@[    else]@
@{
if isinstance(member.type.basetype, String):
    array_init = 'rosidl_generator_c__String__Sequence__init'
    array_fini = 'rosidl_generator_c__String__Sequence__fini'
elif isinstance(member.type.basetype, WString):
    array_init = 'rosidl_generator_c__U16String__Sequence__init'
    array_fini = 'rosidl_generator_c__U16String__Sequence__fini'
elif isinstance(member.type.basetype, BasicType):
    type_ = member.type.basetype
    if type_.type == 'char':
        type_.type = 'uint8'
    array_init = 'rosidl_generator_c__{type_.type}__Sequence__init'.format(**locals())
    array_fini = 'rosidl_generator_c__{type_.type}__Sequence__fini'.format(**locals())
else:
    member_pkg_name = '__'.join(member.type.basetype.namespaces)
    array_init = '{member_pkg_name}__{member.type.basetype.name}__Sequence__init'.format(**locals())
    array_fini = '{member_pkg_name}__{member.type.basetype.name}__Sequence__fini'.format(**locals())
}@
    size_t size = dds_message->@(member.name)_.length();
    if (ros_message->@(member.name).data) {
      @(array_fini)(&ros_message->@(member.name));
    }
    if (!@(array_init)(&ros_message->@(member.name), size)) {
      return "failed to create array for field '@(member.name)'";
    }
@[    end if]@
    for (DDS::ULong i = 0; i < size; i++) {
@[    if isinstance(member.type, Array)]@
      auto & ros_i = ros_message->@(member.name)[i];
@[    else]@
      auto & ros_i = ros_message->@(member.name).data[i];
@[    end if]@
@[    if isinstance(member.type.basetype, BasicType)]@
@[      if member.type.basetype.type == 'boolean']@
      ros_i = (dds_message->@(member.name)_[i] != 0);
@[      else]@
      ros_i = dds_message->@(member.name)_[i];
@[      end if]@
@[    elif isinstance(member.type.basetype, String)]@
      if (!ros_i.data) {
        rosidl_generator_c__String__init(&ros_i);
      }
      bool succeeded = rosidl_generator_c__String__assign(
        &ros_i,
        dds_message->@(member.name)_[i]);
      if (!succeeded) {
        return "failed to assign string into field '@(member.name)'";
      }
@[    elif isinstance(member.type.basetype, WString)]@
      if (!ros_i.data) {
        rosidl_generator_c__U16String__init(&ros_i);
      }
      bool succeeded = rosidl_generator_c__U16String__assign(
        &ros_i,
        dds_message->@(member.name)_[i]);
      if (!succeeded) {
        return "failed to assign string into field '@(member.name)'";
      }
@[    else]@
      const rosidl_message_type_support_t * ts =
        ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_opensplice_c, @(', '.join(member.type.basetype.namespaces)), @(member.type.basetype.name))();
      const message_type_support_callbacks_t * callbacks =
        static_cast<const message_type_support_callbacks_t *>(ts->data);
      callbacks->convert_dds_to_ros(&dds_message->@(member.name)_[i], &ros_i);
@[    end if]@
    }
@[  elif isinstance(member.type, String)]@
    if (!ros_message->@(member.name).data) {
      rosidl_generator_c__String__init(&ros_message->@(member.name));
    }
    bool succeeded = rosidl_generator_c__String__assign(
      &ros_message->@(member.name),
      dds_message->@(member.name)_);
    if (!succeeded) {
      return "failed to assign string into field '@(member.name)'";
    }
@[  elif isinstance(member.type, WString)]@
    if (!ros_message->@(member.name).data) {
      rosidl_generator_c__U16String__init(&ros_message->@(member.name));
    }
    bool succeeded = rosidl_generator_c__U16String__assign(
      &ros_message->@(member.name),
      dds_message->@(member.name)_);
    if (!succeeded) {
      return "failed to assign string into field '@(member.name)'";
    }
@[  elif isinstance(member.type, BasicType)]@
    ros_message->@(member.name) = @('(' if member.type.type == 'boolean' else '')dds_message->@(member.name)_@(' != 0)' if member.type.type == 'boolean' else '');
@[  else]@
    const rosidl_message_type_support_t * ts =
      ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_opensplice_c, @(', '.join(member.type.namespaces)), @(member.type.name))();
    const message_type_support_callbacks_t * callbacks =
      static_cast<const message_type_support_callbacks_t *>(ts->data);
    callbacks->convert_dds_to_ros(&dds_message->@(member.name)_, &ros_message->@(member.name));
@[  end if]@
  }

@[end for]@
  return 0;
}

static const char *
take_@(__static_suffix)(
  void * dds_data_reader,
  bool ignore_local_publications,
  void * untyped_ros_message,
  bool * taken,
  void * sending_publication_handle)
{
  if (untyped_ros_message == 0) {
    return "invalid ros message pointer";
  }

  DDS::DataReader * topic_reader = static_cast<DDS::DataReader *>(dds_data_reader);

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
    errs = convert_dds_to_ros_@(__static_suffix)(&dds_messages[0], untyped_ros_message);
    if (errs != 0) {
      goto finally;
    }
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
      return nullptr;
    default:
      return "@(__dds_msg_type_prefix)DataReader.return_loan failed with "
             "unknown return code";
  }

  return errs;
}

static const char *
serialize_@(__static_suffix)(
  const void * untyped_ros_message,
  void * untyped_serialized_data)
{
  if (!untyped_ros_message) {
    return "ros message handle is null";
  }
  if (!untyped_serialized_data) {
    return "serialized_data handle is null";
  }

  __dds_msg_type_@(__static_suffix) dds_message;
  const char * err_msg = convert_ros_to_dds_@(__static_suffix)(untyped_ros_message, &dds_message);
  if (err_msg != 0) {
    return err_msg;
  }

  DDS::OpenSplice::CdrTypeSupport cdr_ts(_type_support_@(__static_suffix));

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

static const char *
deserialize_@(__static_suffix)(
  const uint8_t * buffer,
  unsigned length,
  void * untyped_ros_message)
{
  const char * errs = nullptr;

  if (untyped_ros_message == 0) {
    return "invalid ros message pointer";
  }

  DDS::OpenSplice::CdrTypeSupport cdr_ts(_type_support_@(__static_suffix));

  __dds_msg_type_@(__static_suffix) dds_message;
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

  errs = convert_dds_to_ros_@(__static_suffix)(&dds_message, untyped_ros_message);

  return errs;
}

@
@# // Collect the callback functions and provide a function to get the type support struct.

static message_type_support_callbacks_t @(message.structure.type.name)__callbacks = {
  "@(package_name)",  // package_name
  "@(message.structure.type.name)",  // message_name
  register_type_@(__static_suffix),  // register_type
  publish_@(__static_suffix),  // publish
  take_@(__static_suffix),  // take
  serialize_@(__static_suffix),  // serialize message
  deserialize_@(__static_suffix),  // deserialize message
  convert_ros_to_dds_@(__static_suffix),  // convert_ros_to_dds
  convert_dds_to_ros_@(__static_suffix),  // convert_dds_to_ros
};

static rosidl_message_type_support_t @(message.structure.type.name)__type_support = {
  rosidl_typesupport_opensplice_c__identifier,
  &@(message.structure.type.name)__callbacks,  // data
  get_message_typesupport_handle_function,
};

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(
  rosidl_typesupport_opensplice_c,
  @(', '.join(message.structure.type.namespaces)),
  @(message.structure.type.name))()
{
  return &@(message.structure.type.name)__type_support;
}

#if defined(__cplusplus)
}
#endif
