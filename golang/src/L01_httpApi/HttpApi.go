package main

import (
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/http"
)

//Ret ...
type Ret struct {
	Code int    `json:"code,int"`
	Data string `json:"data"`
}

func printRequest(w http.ResponseWriter, r *http.Request) {
	fmt.Println("r.Form=", r.Form) //这些信息是输出到服务器端的打印信息 , Get参数
	ret := new(Ret)

	ret.Code = 200
	ret.Data = "提交成功"
	w.Header().Set("Content-Type", "application/json; charset=utf-8")
	retJSON, _ := json.Marshal(ret)
	io.WriteString(w, string(retJSON))
}

func sayMore(w http.ResponseWriter, r *http.Request) {
	r.ParseForm() //解析参数，默认是不会解析的
	printRequest(w, r)
}

func main() {
	http.HandleFunc("/api/room/order", sayMore) //设置访问的路径
	err := http.ListenAndServe(":8888", nil)    //设置监听的端口
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
