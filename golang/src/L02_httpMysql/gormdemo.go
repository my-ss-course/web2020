package main

import (
	"errors"
	"fmt"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

//Building ...
type Building struct {
	ID           int    `gorm:"primaryKey"`
	BuildingNo   int    `gorm:"column:buildingNo"`
	BuildingName string `gorm:"column:buildingName"`
	Status       int    `gorm:"column:status"` //0 新生不可见
}

func main() {
	dsn := "web2020:web2020@tcp(127.0.0.1:3306)/web2020?charset=utf8mb4&parseTime=True&loc=Local"

	buidling := 5
	count := 4

	//连接数据库

	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println("------------连接数据库成功-----------")
	isok := 0

	// 取出楼ID
	building := Building{}
	errBuilding := db.Table("web2020_dorm_building").Where(" status = 1").Where(" buildingNO = ?", buidling).First(&building).Error
	if errors.Is(errBuilding, gorm.ErrRecordNotFound) {
		fmt.Println("该楼不满足新生住宿申请条件")
	} else {
		isok = 1
		fmt.Println(building.BuildingName)
	}

	// 检查人员是否符合申请条件，必须都为新生，并且在名单内，性别与申请的一致,检查人员是否已经分配了宿舍

	if isok == 1 && count > 4 {
		fmt.Println("同住人数量参数错误")
		isok = 0
	}

	// 开始事务
	tx := db.Begin()

	if isok == 1 {
		// 如果找到
		// 1、写入宿舍数据
		// 将学号，姓名  写入到相应的宿舍床位中
		// (1)取出该房间内的床位个数，床位状态必须为可用，未分配，
		// (2)检查数量的否符合分配的数量
		// (3)分别写入相应的床位状态，已分配、学号、姓名，将学生的状态设置已经分配宿舍
		switch count {
		case 4:

		case 3:

		case 2:

		case 1:

		}

		// 2、将房间的空床数设置为相应的真实值
		// 将宿舍空床位数减去入住人数

		// 3、把申请宿舍订单写入订单表中,状态为成功

	} else {
		// 如果未找到

	}

	// 否则，提交事务
	tx.Commit()

}
