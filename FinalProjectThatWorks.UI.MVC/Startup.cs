using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FinalProjectThatWorks.UI.MVC.Startup))]
namespace FinalProjectThatWorks.UI.MVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
