// Mocks generated by Mockito 5.4.6 from annotations
// in memora/test/main_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:memora/application/usecases/get_groups_with_members_usecase.dart'
    as _i5;
import 'package:memora/domain/repositories/group_member_repository.dart' as _i3;
import 'package:memora/domain/repositories/group_repository.dart' as _i2;
import 'package:memora/domain/repositories/member_repository.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGroupRepository_0 extends _i1.SmartFake
    implements _i2.GroupRepository {
  _FakeGroupRepository_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeGroupMemberRepository_1 extends _i1.SmartFake
    implements _i3.GroupMemberRepository {
  _FakeGroupMemberRepository_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeMemberRepository_2 extends _i1.SmartFake
    implements _i4.MemberRepository {
  _FakeMemberRepository_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [GetGroupsWithMembersUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetGroupsWithMembersUsecase extends _i1.Mock
    implements _i5.GetGroupsWithMembersUsecase {
  MockGetGroupsWithMembersUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GroupRepository get groupRepository =>
      (super.noSuchMethod(
            Invocation.getter(#groupRepository),
            returnValue: _FakeGroupRepository_0(
              this,
              Invocation.getter(#groupRepository),
            ),
          )
          as _i2.GroupRepository);

  @override
  _i3.GroupMemberRepository get groupMemberRepository =>
      (super.noSuchMethod(
            Invocation.getter(#groupMemberRepository),
            returnValue: _FakeGroupMemberRepository_1(
              this,
              Invocation.getter(#groupMemberRepository),
            ),
          )
          as _i3.GroupMemberRepository);

  @override
  _i4.MemberRepository get memberRepository =>
      (super.noSuchMethod(
            Invocation.getter(#memberRepository),
            returnValue: _FakeMemberRepository_2(
              this,
              Invocation.getter(#memberRepository),
            ),
          )
          as _i4.MemberRepository);

  @override
  _i6.Future<List<_i5.GroupWithMembers>> execute() =>
      (super.noSuchMethod(
            Invocation.method(#execute, []),
            returnValue: _i6.Future<List<_i5.GroupWithMembers>>.value(
              <_i5.GroupWithMembers>[],
            ),
          )
          as _i6.Future<List<_i5.GroupWithMembers>>);
}
