<?php
namespace app\admin\controller;

use think\Controller;

class Admin extends Common
{
    /**
     * 登入
     */
    public function index()
    {
        return $this->fetch('index');
    }

    public function public_edit_info()
    {
        return $this->fetch('public_edit_info');
    }
}
