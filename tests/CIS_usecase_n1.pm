# Usecase n1 dle CIS standardu

use base 'basetest';
use strict;
use testapi;

sub run {
    # Instalace OS
    assert_screen 'install_button_bootscreen';
    send_key 'ret';
    
    # Kontrola, zda je prihlasovaci okno prazdne
    # Kontrola, zda je zde warning banner 
    assert_screen 'login_window_loginscreen', 1500;
    assert_screen 'authorized_uses_only_loginscreen', 5;
    type_string 'eris';
    send_key 'tab';
    type_string 'eris';
    send_key 'ret';    

    # Prihlaseni jako root a nasledny restart
    assert_screen 'desktop_view_default', 30;
    send_key 'ctrl-shift-alt-x';
    assert_screen 'konsole_eris_qemu', 60;
    type_string 'su';
    send_key 'ret';
    type_password 'root';
    send_key 'ret';
    assert_screen 'become_root', 30;
    enter_cmd 'reboot';

    # Kontrola, zda je prihlasovaci okno po prihlaseni jako root a restartu prazdne
    assert_screen 'login_window_loginscreen', 80;
    assert_screen 'authorized_uses_only_loginscreen', 5;
}

sub test_flags {
    return {fatal => 1};
}

1;
