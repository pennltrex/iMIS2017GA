<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Young_Physicians" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("19e96209-5ace-4274-9cb1-5f947ca26891"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("7c95e3e0-9328-41a9-b6f0-02d1eb685ced"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewContentHtml_d32d0b51515f4e71a777fa7be906d7f8 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d32d0b51-515f-4e71-a777-fa7be906d7f8");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml_d32d0b51515f4e71a777fa7be906d7f8);

		childUserControl = ciHeaderTesting_6b1e6f70708c42a48df742e1a6be50ca as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6b1e6f70-708c-42a4-8df7-42e1a6be50ca");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciHeaderTesting_6b1e6f70708c42a48df742e1a6be50ca);

	}
</script>
<asp:Content ID="TemplateUserMessages" ContentPlaceHolderID="TemplateUserMessages" runat="server"></asp:Content>
<asp:Content ID="TemplateBody" ContentPlaceHolderID="TemplateBody" Runat="Server">
<script type="text/javascript">

</script>
	<asiweb:AsiWebPartManager id="WebPartManager1" runat="server">
		<StaticConnections>
		</StaticConnections>
	</asiweb:AsiWebPartManager>
<div>
	<div class="row">
		<div class="col-sm-12">
						<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciNewContentHtml_d32d0b51515f4e71a777fa7be906d7f8" runat="server" ContentKey="19e96209-5ace-4274-9cb1-5f947ca26891" ContentItemKey="d32d0b51-515f-4e71-a777-fa7be906d7f8" Title="New ContentHtml" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml" runat="server"><p><img alt="" src="/images/WSMA/ForMembers/YPS/YPS-BannerHome718px.png" /></p>
<p>The Young Physician Section is composed of physician members of the WSMA who are either under 40 years of age or within the first ten years of professional practice after residency and fellowship training.</p>
<p>The purpose of the YPS is to introduce young physicians to the programs, benefits, services and policy-making structure of the WSMA and to help provide programs and services that will assist YPS members in their transition from training programs to full-time practice.</p>
<p><a href="https://twitter.com/WSMA_update" target="_blank"><img alt="" align="middle" width="25" src="/images/WSMA/Buttons/twitter2_100px.png" style="margin-top: 0px; margin-bottom: 0px; margin-right: 5px; vertical-align: middle;" /></a> <a href="http://www.facebook.com/pages/Washington-State-Medical-Association-WSMA/41526982887" target="_blank"><img alt="" align="middle" width="25" src="/images/WSMA/Buttons/facebook_100px.png" style="border-width: 0px; border-style: solid; vertical-align: middle;" /></a>     <strong><span style="font-size: small;">FOLLOW THE WSMA</span><br />
</strong></p>
<p> </p>
<p><img alt="" src="/images/WSMA/ForMembers/YPS/YPS-SubheadNewsEvents718px.png" /></p>
<p>For news of interest to our young and early-career physicians, and for information on upcoming events, visit our <a href="/wcm/For_Members/Young_Physicians/YPS_News_and_Comment/wcm/For_Members/YoungPhysicians/YPS_News_and_Comment.aspx?hkey=586b697e-34d3-45c6-ac1b-3a30ac8d50b1">YPS News and Comment page</a>.</p>
<p><img alt="" src="/images/WSMA/ForMembers/YPS/YPS-SubheadFaces718px.png" /></p>
<p>The work of the Young Physician Section is led by a governing council of dedicated, creative and energetic physicians who are committed to <span style="line-height: 18.005px;">turning today’s young physicians into tomorrow’s health care leaders and ensuring</span> Washington state remains the best place to practice medicine and receive care.</p>
<p>
<a href="/wcm/For_Members/Young_Physicians/YPS_Governing_Council/wcm/For_Members/YoungPhysicians/YPS_Governing_Council.aspx?hkey=f49cf49b-b28e-4a7f-8487-2f811cf039d3">Learn more about the physicians who make up the Governing Council</a>.</p>
<p><img alt="" src="/images/WSMA/ForMembers/YPS/YPS-SubheadLegalGuidance718px.png" /></p>
<p>You help your patients, we help you understand the law and regulations affecting your practice.
</p>
<p>
Below you’ll find a selection of our legal resources that may be of particular interest to young and early-career physicians. For personal assistance, contact Tierney Edwards, JD at <a href="mailto:tee@wsma.org">tee@wsma.org</a> for more information or clarification on what the law requires of physicians.
</p>
<ul>
    <li>
    <a href="/wcm/Legal_Resource_Center/Contracting_Resources/wcm/Legal_Resource_Center/Contracting_Resources_and_Evaluation.aspx?hkey=dded806a-46a3-4c3a-85da-aeaaf43a0fe6">Contracting resources</a></li>
    <li>
    <a href="/wcm/Legal_Resource_Center/Social_Media_and_Internet/wcm/Legal_Resource_Center/Social_Media/Social_Media_and_Internet_Use.aspx?hkey=de20f3ed-52e7-4c6d-9115-8d649d8bb77b">Social media and the Internet</a></li>
    <li>
    The <a href="/wcm/Legal_Resource_Center/Physicians__Guide_to_Health_Law/wcm/Legal_Resource_Center/Physicians__Guide_to_Health_Law.aspx?hkey=61da6f47-1322-4de8-b799-a5befc53f703">Washington Physicians' Guide to Health Law</a>: An online summary of many laws commonly encountered in a medical practice</li>
</ul>
<p>
</p>
<p><img src="/images/WSMA/ForMembers/YPS/YPS-SubheadLeadership718px.png" alt="Young physician leadership development" /></p>
<p>The WSMA is committed to your professional development, particularly enhancing and building your leadership skills, at every stage of your career.</p>
<p>The following leadership development resources and opportunities are available through the WSMA. For more leadership development opportunities, visit our <a href="https://wsma.org/wcm/Education_and_Events/Leadership/wcm/EducationandEvents/Leadership/Leadership-Development.aspx?hkey=f11ae0b7-5fbe-4bd9-be95-c287de9c670f">Center for Leadership</a>, found under Education and Events.</p>
<ul>
    <li><a href="/wcm/Education_and_Events/Leadership/Leadership_Course/wcm/EducationandEvents/Leadership/Leadership_Course.aspx?hkey=ac797fce-61a2-4763-bbde-995e4769b41b">WSMA Leadership Course</a></li>
    <li><a href="/wcm/Education_and_Events/Leadership/Leadership_Development_Conference/wcm/EducationandEvents/Leadership/Leadership_Development_Conference.aspx?hkey=6f5a141b-86a2-4d94-b7ac-5a05f2b36f17">WSMA Leadership Development Conference</a></li>
    <li> <a href="/wcm/Education_and_Events/Leadership/On_Demand_-_Leadership/wcm/EducationandEvents/Leadership/On_Demand_-_Leadership_Development.aspx?hkey=e2290038-1c95-43fa-b392-429a26ba363d">Leadership Development On Demand</a></li>
    <li> <a href="/wcm/Education_and_Events/Leadership/Medical_Officer_Collaborative/wcm/EducationandEvents/Leadership/CMO_Learning_Collaborative.aspx?hkey=153b6d1d-f7eb-4a4f-95c7-17f3800375e4">CMO Learning Collaborative</a></li>
    <li><a href="https://wsma.org/wcm/Career_Center/wcm/Careers/Career_Center.aspx">Career Center</a></li>
</ul>
<p><img alt="" src="/images/WSMA/ForMembers/YPS/YPS-SubheadMentorship718px.png" /></p>
<p>The Young Physician Section has introduced a mentorship program to connect our young physicians with more experienced physicians within the WSMA. The program provides an opportunity for those physicians early in their career to further develop professionally by sharing ideas and experiences with established physicians. For those more seasoned physicians, their mentee can provide a window to the interests and emerging trends from the next generation of their peers. </p>
<p><a href="http://wsma.org/wcm/For_Members/WSMA_Mentorship_Auth/wcm/For_Members/WSMA_Mentorship_Auth.aspx?hkey=23fcd3f1-3c10-4a57-a0fe-57a87ff6dd16#b">Find out more about the WSMA Mentorship Program</a>.</p>
<p><img alt="" src="/images/WSMA/ForMembers/YPS/YPS-SubheadBusinessSide718px.png" /></p>
<p>For a physician new to practice, the business side of medicine can be daunting. WSMA’s education program, Physicians Business Skills, seeks to give new physicians a better understanding of the health care marketplace, focusing on internal finances, financial relationships with external partners and general compliance issues. The full program, consisting of seven webinars, is available for viewing on demand individually or together. </p>
<p><a href="/wcm/Education_and_Events/Leadership/On_Demand_-_Leadership_Development/wcm/EducationandEvents/Leadership/On_Demand_-_Leadership_Development.aspx?hkey=e2290038-1c95-43fa-b392-429a26ba363d">Find out more about WSMA Physicians Business Skills</a>.
</p>
<p><img alt="" src="/images/WSMA/ForMembers/YPS/YPS-SubheadAboutWSMA718px.png" /></p>
<p>The Young Physician Section connects young and early-career physicians to the policy-making structure of the WSMA, ensuring that their perspective is heard and honored as we work together to influence health care policy.</p>
<p>
Members are encouraged to become more involved in the work of the association. Let us know if you are interested in serving on a committee, participating in a leadership role, or sharing your passion and expertise with your peers. Contact member services at (206) 441-9762, (800) 552-0612 or <a href="mailto:membership@wsma.org">membership@wsma.org</a>.</p>
<ul>
    <li>
    <a href="/wcm/The_Organization/wcm/AboutWSMA/TheOrganization/The_Organization.aspx?hkey=3bcdd13e-832b-4b19-ad88-42ce1dc06ff1">About the WSMA</a></li>
    <li><a href="/wcm/The_Organization/Policies/wcm/AboutWSMA/Policies.aspx?hkey=87452eea-30e1-4ff7-a245-2f730d22eeae">WSMA's policies</a></li>
    <li><a href="/wcm/The_Organization/Strategic_Plan/wcm/AboutWSMA/TheOrganization/Strategic_Plan.aspx?hkey=03858f9f-7fbf-40fc-8c20-a66c0cadac0f">WSMA's three-year strategic plan</a>
    </li>
</ul>
<!--HIDE<div  _rdEditor_temp="1"><img alt="" src="/images/WSMA/ForMembers/YPS/YPS-SubheadTips718px.png" /></div>
<div  _rdEditor_temp="1">5 tips for using social media:</div>
<ul>
    <li>Keep professional social media use separate from personal use.</li>
    <li>Maintain patient confidentiality in all social media postings – avoid HIPAA violations.</li>
    <li>Avoid interacting with patients through social media unless it is through a secure network designed to protect doctor-patient confidentiality.</li>
    <li>Do not “friend” patients.</li>
    <li>Avoid making derogatory or negative comments about patients or your workplace.</li>
</ul>
<div  _rdEditor_temp="1">See also the WSMA's Web page [[Social_Media_and_Internet_Use]] where you'll find lots of resources and sample guidelines.</div>
<div  _rdEditor_temp="1"> </div>-->
<!--HIDE<div  _rdEditor_temp="1"><img src="/images/WSMA/ForMembers/YPS/YPS-SubheadFaces718px.png" alt="Young physician faces of the future" /></div>
<div  _rdEditor_temp="1"><strong><span style="font-size: 13px;">DOMINIQUE COCO, MD</span></strong><br />
<span style="line-height: 12px; font-size: 10px;">
YPS GOVERNING COUNCIL CHAIR<br />
YPS DELEGATE TO THE WSMA HOUSE<br />
SPECIALTY: PATHOLOGY<br />
PRACTICE: CELINETIX PATHOLOGY - OLYMPIA</span></div>
<div  _rdEditor_temp="1"><img src="/images/WSMA/ForMembers/YPS/Coco125px.png" alt="Dr. Coco" style="float: left; margin-right: 15px; margin-bottom: 15px;" />AS A LOUISIANA NATIVE, Dr. Coco was literally born on the bayou (or  at least right next to it). He received his medical degree at Louisiana  State University in New Orleans before going on to complete two years of  residency in general surgery at the University of Florida. He then  transitioned into clinical and anatomic pathology and completed four  years of residency at the University of Florida and two years of  fellowship training at Brigham and Women’s Hospital in Boston. He  currently lives in Olympia and is part of a large pathology practice  that services much of Western Washington.</div>
<div  _rdEditor_temp="1">Below Dr. Coco shares some of his thoughts about being a young physician.</div>
<div  _rdEditor_temp="1"><strong>What were the biggest challenges that you faced in your first year of practice? </strong><br />
Finding the right balance between work and family is perhaps the  biggest challenge facing a young professional just starting their career  in medicine.  The first year in practice is arguably the biggest  transition point in our career.  There is a tremendous shift in  responsibility compounded by the expectation of productivity.  This can  take a significant toll on family life at a time when most of us have  young families and family responsibilities are demanding.</div>
<div  _rdEditor_temp="1"><strong>What do you think are the biggest issues facing young physicians?  <br />
</strong>The  changing landscape of medical reimbursement coupled by the expansion of insurance and an aging population which bring unique challenges to  medicine and will likely reshape how we practice.  As young physicians,  we will feel the greatest effect of these changes.</div>
<div  _rdEditor_temp="1"><strong>Why should young physicians get involved in WSMA? </strong><br />
The  practice of medicine is likely going to change significantly over the  next decade.  It is important for us to get involved so that we can be  part of the solution and help shape the future of medicine.  WSMA is an  excellent source for understanding the forces that govern the practice  of medicine.  It is also an excellent platform to promote physician and  patient rights and can help you find your voice in your community and  state.</div>
<div  _rdEditor_temp="1"><strong>How do you think your medical specialty will change in the next decade? </strong><br />
Molecular pathology is becoming more and more important in bringing  personalized medicine to cancer therapy.  Now with next generation  sequencing, large areas of the genome can be evaluated at a fraction of  the cost and in a more timely manner than many predicted only a few  years ago.   We will likely see further integration of molecular  pathology in pathologic assessment of cancer to broaden our therapeutic  options and to provide more prognostic information.</div>
<div  _rdEditor_temp="1"> </div>--></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciHeaderTesting_6b1e6f70708c42a48df742e1a6be50ca" runat="server" ContentKey="19e96209-5ace-4274-9cb1-5f947ca26891" ContentItemKey="6b1e6f70-708c-42a4-8df7-42e1a6be50ca" Title="Header Testing" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_HeaderTesting" runat="server"><h1>This is an H1 test line</h1>
<h2 >This is an H2 test line</h2>
<h3 >This is an H3 test line</h3>
<h4 >This is an H4 test line</h4>
<br />
<h5>This is an H5 test line</h5>
<h6 >This is an H6 test line</h6></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
	</div>
</div>	
<CM:ContentPageFooter ID="ContentPageFooter1" runat="server" NumberOfPages="1" />

    <asiweb:AsiWebPartEditorZone ID="EditorZone1" runat="server">
        <ZoneTemplate>
            <asp:PropertyGridEditorPart ID="PropertyGridEditor" runat="server" />
        </ZoneTemplate>
    </asiweb:AsiWebPartEditorZone>
    <asiweb:AsiWebPartConnectionsZone ID="ConnectionZone1" runat="server" CloseVerb-Visible="false" />
</asp:Content>