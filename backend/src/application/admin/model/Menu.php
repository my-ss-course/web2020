<?php

/**
 *
 * @file   Menu.php
 * @date   2016-9-1 15:48:53
 * @author Zhenxun Du<5552123@qq.com>
 * @version    SVN:$Id:$
 */

namespace app\admin\model;

use think\Model;

class Menu extends Model {
    /**
     * 我的菜单
     * @param type $display
     * @return array
     */
    public function getMyMenu($display = null) {
        $where = array();
        $user_id = session('user_id');
        $group_id = session('group_id');
        if ($user_id != 1) {
            $res = db('admin_group')
                ->field('rules')
                ->where('id','in', $group_id)
                ->select();
            if (!$res) {
                return false;
            }
            $tmp = '';
            foreach ($res as $k => $v) {
                $tmp .=$v['rules'] . ',';
            }

            $menu_ids = trim($tmp, ',');
            $where['id'] = ['in', $menu_ids];
        }


        if ($display) {
            $where['display'] = $display;
        }

        $res = db('menu')->where($where)->order('listorder asc')->select();

        return $res;
    }

}