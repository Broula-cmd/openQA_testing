# Copyright 2014-2018 SUSE LLC
# SPDX-License-Identifier: GPL-2.0-or-later


use Mojo::Base -strict;
use testapi;
use autotest;

autotest::loadtest 'tests/CIS_usecase_n1.pm';

1;
