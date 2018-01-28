#!/usr/bin/env perl

## this file is part of sylspace, released under the AGPL, 2016, authored by ivo welch, ucla.
## one additional condition requires the prominent posting of the name (sylspace) and the author.

package SylSpace::Controller::Equizcenter;
use Mojolicious::Lite;  ## implied strict, warnings, utf8, 5.10
use lib qw(.. ../..); ## make syntax checking easier
use strict;

use SylSpace::Model::Model qw(isinstructor);
use SylSpace::Model::Controller qw(global_redirect standard);

################################################################
## a redirector
################################################################

get '/equizcenter' => sub {
  my $c = shift;
  (my $course = standard( $c )) or return global_redirect($c);

  (isinstructor($course, $c->session->{uemail})) and return $c->redirect_to('/instructor/equizcenter');
  return $c->redirect_to('/student/equizcenter');
};
