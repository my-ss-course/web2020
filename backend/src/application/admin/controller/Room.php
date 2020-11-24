<?php
namespace app\admin\controller;

use think\Controller;

class Room extends Common
{
    /**
     * 登入
     */
    public function index()
    {
        return $this->fetch('index');
    }

    /**
     * 登入
     */
    public function checkin()
    {
        return $this->fetch('checkin');
    }

    /**
     * 登入
     */
    public function checkout()
    {
        return $this->fetch('checkout');
    }
}
