<?php

/**
 *  布居
 * @file   menu.php
 * @date   2016-9-2 16:18:45
 * @author Zhenxun Du<5552123@qq.com>
 * @version    SVN:$Id:$
 */

namespace app\admin\widget;

class Menu {

    public function __construct() {
        if (!session('user_id')) {
            return false;
        }
    }

    public function index() {
        $menu = model('Menu')->getMyMenu(1);

        $menuTree = list_to_tree($menu);

        trace($menuTree);

        $html = '<ul id="nav">';
        $html .=$this->menu_tree($menuTree);
        $html .= "
                </ul>";
        //echo $html;exit;
        return $html;
    }
    private function check_menu_open($tree){
        if (is_array($tree)) {
            foreach ($tree as $val) {
                if ($val['c'] == request()->controller() && $val['a'] == request()->action()) {
                    return true;
                }
            }
        }
        return false;
    }

    private function menu_tree($tree) {

        $html = '';

        if (is_array($tree)) {

            foreach ($tree as $val) {

                if (isset($val["name"])) {
                    $title = $val["name"];

                    if (!empty($val["a"])) {
                        $url = url('@admin/' . $val['c'] . '/' . $val['a']);
                    }

                    if (empty($val['icon'])) {
                        $icon = "&#xe6a7;";
                    } else {
                        $icon = "&#".$val['icon'].";";
                    }

                    if ($val['c'] == request()->controller() && $val['a'] == request()->action()) {
                        $current = 'current';
                    } else {
                        $current = '';
                    }

                    $opened ='';

                    if (isset($val['_child'])) {
                        if($this->check_menu_open($val['_child']))
                            $opened ='opened';
                        $html.=' 
                            <li class="list">
                                <a href="javascript:;">
                                    <i class="iconfont">' . $icon . '</i>
                                    ' . $title . '
                                    <i class="iconfont nav_right">&#xe697;</i>
                                </a>
                                <ul class="sub-menu '.$opened.' ">
                            ';

                        $html.=$this->menu_tree($val['_child']);

                        $html.='              
                            </ul>
                        </li>
                        ';
                    } else {

                        $html.='
                            <li class="'.$current.'">
                            <a href = "' . $url . '">
                            <i class="iconfont">' .  $icon. '</i>
                            ' .  $title . '
                              
                            </a>
                            </li>
                            ';
                    }
                }
            }
        }

        return $html;
    }

}