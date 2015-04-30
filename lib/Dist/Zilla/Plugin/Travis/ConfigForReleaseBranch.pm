#
# This file is part of Dist-Zilla-Plugin-Travis-ConfigForReleaseBranch
#
# This software is Copyright (c) 2013 by Chris Weyl.
#
# This is free software, licensed under:
#
#   The GNU Lesser General Public License, Version 2.1, February 1999
#
package Dist::Zilla::Plugin::Travis::ConfigForReleaseBranch;
our $AUTHORITY = 'cpan:RSRCHBOY';
# git description: 0.002-3-gfdfd95f
$Dist::Zilla::Plugin::Travis::ConfigForReleaseBranch::VERSION = '0.003'; # TRIAL

# ABSTRACT: Create a C<.travis.yml> suitable for built branches

use Moose;
use namespace::autoclean;
extends 'Dist::Zilla::Plugin::InlineFiles';


__PACKAGE__->meta->make_immutable;
!!42;

=pod

=encoding UTF-8

=for :stopwords Chris Weyl

=for :stopwords Wishlist flattr flattr'ed gittip gittip'ed

=head1 NAME

Dist::Zilla::Plugin::Travis::ConfigForReleaseBranch - Create a C<.travis.yml> suitable for built branches

=head1 VERSION

This document describes version 0.003 of Dist::Zilla::Plugin::Travis::ConfigForReleaseBranch - released April 29, 2015 as part of Dist-Zilla-Plugin-Travis-ConfigForReleaseBranch.

=head1 SYNOPSIS

    ; in your dist.ini
    [Travis::ConfigForReleaseBranch]

=head1 DESCRIPTION

This is a simple L<Dist::Zilla::Plugin::InlineFiles> plugin to include a
sensible -- or so this author believes -- C<.travis.yml> suitable for running
L<Travis-CI jobs|http://travis-ci.org> off of a release branch like one
generated by the L<Dist::Zilla::Plugin::Git::CommitBuild>
plugin.

By default, we build against Perl 5.8, 5.10, 5.12, 5.14, 5.16, 5.18, 5.20, and
5.21.  The 5.8 and 5.21 build jobs are allowed to fail without causing the
entire build run to fail.

=head1 EARLY VERSION!

Yep, this is an early, early version.  No tests, and no flexibility in
configuration details.  Anyone wishing to assist (and faster than this author
in remedying this sad, sad state of affairs) is more than welcome to submit
pull requests.  Good pull requests are likely to earn the undying gratitude of
this humble CPAN author.

=head1 SEE ALSO

Please see those modules/websites for more information related to this module.

=over 4

=item *

L<Dist::Zilla::Plugin::Git::CommitBuild|Dist::Zilla::Plugin::Git::CommitBuild>

=item *

L<Dist::Zilla::TravisCI|Dist::Zilla::TravisCI>

=back

=head1 SOURCE

The development version is on github at L<http://https://github.com/RsrchBoy/dist-zilla-plugin-travis-configforreleasebranch>
and may be cloned from L<git://https://github.com/RsrchBoy/dist-zilla-plugin-travis-configforreleasebranch.git>

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
https://github.com/RsrchBoy/dist-zilla-plugin-travis-configforreleasebranch/issues

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Chris Weyl <cweyl@alumni.drew.edu>

=head2 I'm a material boy in a material world

=begin html

<a href="https://gratipay.com/RsrchBoy/"><img src="http://img.shields.io/gratipay/RsrchBoy.svg" /></a>
<a href="http://bit.ly/rsrchboys-wishlist"><img src="http://wps.io/wp-content/uploads/2014/05/amazon_wishlist.resized.png" /></a>
<a href="https://flattr.com/submit/auto?user_id=RsrchBoy&url=https%3A%2F%2Fgithub.com%2FRsrchBoy%2Fdist-zilla-plugin-travis-configforreleasebranch&title=RsrchBoy's%20CPAN%20Dist-Zilla-Plugin-Travis-ConfigForReleaseBranch&tags=%22RsrchBoy's%20Dist-Zilla-Plugin-Travis-ConfigForReleaseBranch%20in%20the%20CPAN%22"><img src="http://api.flattr.com/button/flattr-badge-large.png" /></a>

=end html

Please note B<I do not expect to be gittip'ed or flattr'ed for this work>,
rather B<it is simply a very pleasant surprise>. I largely create and release
works like this because I need them or I find it enjoyable; however, don't let
that stop you if you feel like it ;)

L<Flattr|https://flattr.com/submit/auto?user_id=RsrchBoy&url=https%3A%2F%2Fgithub.com%2FRsrchBoy%2Fdist-zilla-plugin-travis-configforreleasebranch&title=RsrchBoy's%20CPAN%20Dist-Zilla-Plugin-Travis-ConfigForReleaseBranch&tags=%22RsrchBoy's%20Dist-Zilla-Plugin-Travis-ConfigForReleaseBranch%20in%20the%20CPAN%22>,
L<Gratipay|https://gratipay.com/RsrchBoy/>, or indulge my
L<Amazon Wishlist|http://bit.ly/rsrchboys-wishlist>...  If and *only* if you so desire.

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2013 by Chris Weyl.

This is free software, licensed under:

  The GNU Lesser General Public License, Version 2.1, February 1999

=cut

__DATA__
___[ .travis.yml ]___
# use the container-based infrastructure
sudo: false

language: perl
perl:
   - "5.8"
   - "5.10"
   - "5.12"
   - "5.14"
   - "5.16"
   - "5.18"
   - "5.20"
   - "5.21"

matrix:
   allow_failures:
      - perl: "5.8"
      - perl: "5.21"

before_install:
   # git bits sometimes needed...
   - git config user.name 'Travis-CI'
   - git config user.email 'travis@nowhere.dne'
