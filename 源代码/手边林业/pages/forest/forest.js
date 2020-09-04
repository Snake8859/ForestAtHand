// pages/forest/forest.js
//获取应用实例
const app = getApp();

//引入高德地图
var amapFile = require('../../utils/amap-wx.js');
var utils = require("../../utils/util.js");

var markersData = [];
var flag = 0;
//图片1
var image1 ="";
//图片2
var image2 = "";
//纬度
var latitude = 0;
var longitude = 0; 

Page({
  /**
   * 页面的初始数据
   */
  data: {
    files: [],
    markers: [],
    latitude: '',
    longitude: '',
    textData: {},
  },
  makertap: function (e) {
    var id = e.markerId;
    var that = this;
    that.showMarkerInfo(markersData, id);
    that.changeMarkerColor(markersData, id);
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    var myAmapFun = new amapFile.AMapWX({ key: '94c74e9889b002a30d24d902819e75fa' });
    myAmapFun.getPoiAround({
      iconPathSelected: '../../images/marker.png', //如：..­/..­/img/marker_checked.png
      success: function (data) {
        markersData = data.markers;
        //console.log("纬度：" + markersData[0].latitude + " 经度:" + markersData[0].longitude);
        latitude = markersData[0].latitude;
        longitude = markersData[0].longitude;
        that.setData({
          markers: markersData
        });
        that.setData({
          latitude: markersData[0].latitude
        });
        that.setData({
          longitude: markersData[0].longitude
        });
      },
      fail: function (info) {
        wx.showModal({ title: info.errMsg })
      }
    })
  },
 //表单数据提交
  formSubmit:function(e){
    //console.log(e);
    var fname = e.detail.value.fname;
    var ftype = e.detail.value.ftype;
    var fform = e.detail.value.fform;
    var forigin = e.detail.value.forigin;
    var fgrowtHabit = e.detail.value.fgrowtHabit;
    var TIME = utils.formatTime(new Date());
    //console.log(TIME);
    wx.showToast({
      title: '数据提交中',
      icon: 'loading',
      duration: 3000,
    });
    setTimeout(function(){
      if(fname!=""&&flag>0){
       console.log(latitude+","+longitude);
        wx.request({
          url: 'https://www.snake8859.top/wx_forest/wx/getForestInformation.action',
          data: {
            fName: fname,
            fType: ftype,
            fForm: fform,
            fOrigin: forigin,
            fGrowthHabit: fgrowtHabit,
            creater: app.globalData.username,
            createTime: TIME,
            uid: app.globalData.uid,
            latitude:latitude,
            longitude:longitude,
          },
          method:"POST",
          success:function(dataInfo){
            //console.log(dataInfo);
            //保存fid
            app.globalData.fid = dataInfo.data;
            //console.log(image1);
            //onsole.log(image2);
            //图片上传
            if(image1!=undefined){
              wx.uploadFile({
                url: 'https://www.snake8859.top/wx_forest/wx/getForestPic.action',
                filePath: image1,
                name: 'picFile',
                formData: {
                  'fid': app.globalData.fid,
                },
                success: function (resultInfo) {
                  console.log(resultInfo);
                }
              })
            }
            if(image2!=""){
            wx.uploadFile({
              url: 'https://www.snake8859.top/wx_forest/wx/getForestPic.action',
                filePath: image2,
                name: 'picFile',
                formData: {
                  'fid': app.globalData.fid,
                },
                success: function (resultInfo) {
                  console.log(resultInfo);
                }
              })
            }
            wx.redirectTo({
              url: 'success',
            })
          }
        })
      }
      else{
        wx.showModal({
          title: '温馨提示',
          content: '资源名称和图片为必填',
        })
      }
     
    },3000);
    
  },

 //方案一 相册选择
  chooseImage: function (e) {
    var that = this;
    wx.chooseImage({
      sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
      sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
      success: function (res) {
        //console.log(res.tempFilePaths);
      
        if(res.tempFilePaths[1]!=undefined){
            //同时上传两张图片
            image1 = res.tempFilePaths[0];
            image2 = res.tempFilePaths[1];
            flag = 1;
        }
        else{
            //一次上传一张图片
            //利用flag分辨两种图片
            if (flag % 2 == 0) {
              image1 = res.tempFilePaths[0];
            }
            if (flag % 2 == 1) {
              image2 = res.tempFilePaths[0];
            }
            flag++
        }
       
        // 返回选定照片的本地文件路径列表，tempFilePath可以作为img标签的src属性显示图片
        that.setData({
          files: that.data.files.concat(res.tempFilePaths)
        });
      }
    })
  },
  previewImage: function (e) {
    wx.previewImage({
      current: e.currentTarget.id, // 当前显示图片的http链接
      urls: this.data.files // 需要预览的图片http链接列表
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})