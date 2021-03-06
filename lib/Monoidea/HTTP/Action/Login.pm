# Monoservice - monoidea's monoservice
# Copyright (C) 2019 Joël Krähemann
#
# This file is part of Monoservice.
#
# Monoservice is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Monoservice is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Monoservice.  If not, see <http://www.gnu.org/licenses/>.

package Monoidea::HTTP::Action::Login;

use Moose;
use namespace::clean -except => 'meta';

use LWP::UserAgent;
use HTTP::Request;
use HTTP::Request::Common;

has 'url' => (is => 'rw', isa => 'Str', required => 1);
has 'username' => (is => 'rw', isa => 'Str', required => 1);
has 'password' => (is => 'rw', isa => 'Str', required => 1);

sub do_login {
    my ( $self, $user_agent ) = @_;

    my $request = HTTP::Request::Common::POST($self->url, [ 'username' => $self->username,
							    'password' => $self->password ] );
    my $response = $user_agent->request($request);

    return($response);
}

__PACKAGE__->meta->make_immutable;

1;
