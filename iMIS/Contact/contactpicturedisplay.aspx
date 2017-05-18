<%@ Page language="c#" Debug="True" %>

<script language="C#" runat="server">

private void Page_Load(object sender, EventArgs e)
{
	if (Request.QueryString["ContactPictureKey"] != null)
	{
		Guid contactPictureKey = new Guid(Request.QueryString["ContactPictureKey"]);
		Asi.Business.Contact.ContactPicture cp = Asi.Business.Contact.ContactPictureController.ContactPicture(contactPictureKey, Asi.AppContext.CurrentContext.StatefulBusinessContainer);
		if (cp != null)
		{
			Response.Clear();
			Response.ContentType = cp.MimeType;
			DrawImage(cp.Image);
		}
	}
}

private void DrawImage(byte[] image)
{
	System.Drawing.Image fullsizeImg;
	System.Drawing.Image imageToDraw;
	System.IO.MemoryStream memorybits = new System.IO.MemoryStream(image);
	fullsizeImg = System.Drawing.Image.FromStream(memorybits);
	System.Drawing.Image.GetThumbnailImageAbort myCallback = new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback);

	imageToDraw = fullsizeImg;
	
	if (ImageWidth > 0 && imageToDraw.Width != ImageWidth)
	{
		int height = ImageHeight;
		if (height == 0)
		{
			decimal height2 = (ImageWidth * imageToDraw.Height) / imageToDraw.Width;
			height = (int)System.Math.Round(height2);
		}
		imageToDraw = imageToDraw.GetThumbnailImage(ImageWidth, height, myCallback, IntPtr.Zero);
	}
	
	if (ImageHeight > 0 && imageToDraw.Height != ImageHeight)
	{
		int width = ImageWidth;
		if (width == 0)
		{
			decimal width2 = (ImageHeight * imageToDraw.Width) / imageToDraw.Height;
			width = (int)System.Math.Round(width2);
		}
		imageToDraw = imageToDraw.GetThumbnailImage(width, ImageHeight, myCallback, IntPtr.Zero);
	}
	
	Response.OutputStream.Close();
	//ImageFormat format = new ImageFormat(imageToDraw.RawFormat.Guid);
	//NOTE: ImageFormat doesn't seem to matter.
	//Use Gif for now. fullsizeImg.RawFormat doesn't work
	//for some reason.
	imageToDraw.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Gif);

	if (imageToDraw != fullsizeImg)
		imageToDraw.Dispose();	
	fullsizeImg.Dispose();
}
public bool ThumbnailCallback()
{
	return false;
}
public bool ForceResize
{
	get
	{
		if (Request.QueryString["ForceResize"] != null)
			return bool.Parse(Request.QueryString["ForceResize"]);
		return false;
	}
}
public int ImageWidth
{
	get
	{
		if (Request.QueryString["ImageWidth"] != null)
			return int.Parse(Request.QueryString["ImageWidth"]);
		return 0;
	}
}
public int ImageHeight
{
	get
	{
		if (Request.QueryString["ImageHeight"] != null)
			return int.Parse(Request.QueryString["ImageHeight"]);
		return 0;
	}
}
protected override void OnInit(EventArgs e)
{
	InitializeComponent();
	base.OnInit(e);
}
private void InitializeComponent()
{
	this.Load += new EventHandler(this.Page_Load);
}
</script>