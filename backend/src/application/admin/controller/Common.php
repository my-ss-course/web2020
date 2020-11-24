<?php

/**
 * 后台公共文件
 */

namespace app\admin\controller;

use think\Controller;

class Common extends Controller {

    public function __construct(\think\Request $request = null) {

        parent::__construct($request);

        //检测session是否有效
        if (!session('user_id')) {
            $this->error('请登陆', 'login/index');
        }

        $user_id = session('user_id');

        //权限检查
        if (!$this->_checkAuthor($user_id)) {
            $this->error('你无权限操作');
        }

        //记录日志
        $this->_addLog();
    }

    /**
     * 权限检查
     */
    private function _checkAuthor($user_id) {

        if($user_id==1){
            return true;
        }

        $c = strtolower(request()->controller());
        $a = strtolower(request()->action());

        if (preg_match('/^public_/', $a)) {
            return true;
        }
        if ($c == 'index' && $a == 'index') {
            return true;
        }

        $menu = model('Menu')->getMyMenu();
        foreach ($menu as $k => $v) {
            if (strtolower($v['c']) == $c && strtolower($v['a']) == $a) {
                return true;
            }
        }

        return false;
    }

    /**
     * 记录日志
     */
    private function _addLog() {

        $data = array();
        $data['querystring'] = request()->query()?'?'.request()->query():'';
        $data['m'] = request()->module();
        $data['c'] = request()->controller();
        $data['a'] = request()->action();
        $data['userid'] = session('user_id');
        $data['username'] = session('user_name');
        $data['ip'] = ip2long(request()->ip());
        $data['time'] = time();
        $arr = array('Index/index','Log/index');
        if (!in_array($data['c'].'/'.$data['a'], $arr)) {
            db('admin_log')->insert($data);
        }
    }

}
