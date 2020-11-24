<?php
namespace app\admin\controller;

use think\Controller;

class Group extends Common
{
    /**
     * 登入
     */
    public function index()
    {
        return $this->fetch('index');
    }
}
