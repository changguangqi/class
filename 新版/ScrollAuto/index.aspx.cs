using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    /// <summary>
    /// 本例只是随便取一个值，来展示加载数据的效果
    /// 这个AJAX在实际应用中，是从数据库中取出数据的过程
    /// </summary>
    /// <returns></returns>
    [WebMethod]
    public static string ReturnSth()
    {
        List<something> list = new List<something>();
        for (int i = 0; i < 50; i++)
        {
            something thing = new something
            {
                sth = i.ToString() + "_" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff") + "_" + Guid.NewGuid() + "_我的腾讯微博：<a href='http://t.qq.com/djk8888' target='_blank'>http://t.qq.com/djk8888</a>"
            };
            list.Add(thing);
        }
        return Dos.Common.JSON.ToJSON(list);
    }

    public class something
    {
        public string sth { get; set; }
    }
}