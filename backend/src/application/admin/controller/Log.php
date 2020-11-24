<?php
namespace app\admin\controller;

use think\Controller;

class Log extends Common
{
    /**
     * 登入
     */
    public function index()
    {
        return $this->fetch('index');
    }
}
