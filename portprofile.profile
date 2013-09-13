<?php
function portprofile_install_tasks($install_state) {
    $tasks = array(
        'set_theme' => array(
          'display_name' => st('Set Default themes'),
          'display' => TRUE,
          'type' => 'normal',
          'run' => 'INSTALL_TASK_RUN_IF_NOT_COMPLETED',
          'function' => 'portprofile_set_themes',
        ),
        'disable_frufru' => array(
            'display_name' => st('Disable frufru modules'),
            'display' => TRUE,
            'type' => 'normal',
            'run' => 'INSTALL_TASK_RUN_IF_NOT_COMPLETED',
            'function' => 'portprofile_disable_frufru',
        ),
        
        'set_site_info' => array(
            'display_name' => st('Setting basic site info'),
            'display' => TRUE,
            'type' => 'normal',
            'run' => 'INSTALL_TASK_RUN_IF_NOT_COMPLETED',
            'function' => 'portprofile_set_site_info',
        ),
        
        // 'disable_frufru' => array(
        //     'display_name' => st(''),
        //     'display' => TRUE,
        //     'type' => 'normal',
        //     'run' => 'INSTALL_TASK_RUN_IF_NOT_COMPLETED',
        //     'function' => '',
        // ),

    );
    
    return $tasks;
}


function portprofile_set_themes() {
    // Any themes without keys here will get numeric keys and so will be enabled,
    // but not placed into variables.
    $enable = array(
      'theme_default' => 'adaptivetheme_subtheme',
      'admin_theme' => 'adaptivetheme_admin',
      //'zen'
    );

    foreach ($enable as $var => $theme) {
      theme_enable(array($theme));
      if (!is_numeric($var)) {
        variable_set($var, $theme);
      }
    }

    // Disable the default Bartik theme
    theme_disable(array('bartik'));
    
}

function portprofile_disable_frufru() {
    $frufru = array('overlay', 'toolbar', 'comment');
    module_disable($frufru);
    
}

function portprofile_set_site_info() {
    $site_info = array(
        'site_default_country' => 'US',
        'site_mail' => 'chesleyadler@gmail.com',
        'date_default_timezone' => 'America/Chicago',
        'pathauto_node_pattern' => "[node:content-type]/[node:title]",
    );
    
    foreach ($site_info as $var => $value) {
        variable_set($var, $value);
    }
    
}