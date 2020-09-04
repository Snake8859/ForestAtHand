//index.js
//获取应用实例
const app = getApp()

Page({
  data: {
   
  },
  formSubmit:function(e){
    console.log(e);
    var username = e.detail.value.username;
    var password = e.detail.value.password;
    //前端校验用户名和密码
    if(username!="" && password!=""){
      //重定向到forest
      wx.request({
        url: 'https://www.snake8859.top/wx_forest/user/login.action',
        data: {
          username: username,
          password: password
        },
        method: "POST",
        success: function (dataInfo) {
          console.log(dataInfo.data);
          //登录成功跳转
          if(dataInfo.data.message=="success"){
            //将uid和username存入全局变量
            app.globalData.uid = dataInfo.data.uid;
            app.globalData.username = dataInfo.data.username;
            wx.redirectTo({
              url: '../forest/forest',
            })
         }
         if(dataInfo.data.message=="fail"){
           wx.showModal({
             title: '温馨提示',
             content: '账号或者密码错误',
           })
         }
        }
      })
    }
    else{
      wx.showModal({
        title: '温馨提示',
        content: '用户名或者密码不能为空',
      })
    }
   
  }
})
