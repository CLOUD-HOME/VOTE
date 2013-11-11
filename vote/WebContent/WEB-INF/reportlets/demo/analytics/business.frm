<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20130114" releaseVersion="7.0.4">
<Layout class="com.fr.form.ui.container.WAbsoluteLayout">
<WidgetName name="form"/>
<WidgetAttr/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.IframeEditor">
<WidgetName name="iframeEditor0"/>
<WidgetAttr/>
<Iframe src="${servletURL}?reportlet=demo/analytics/map.cpt&amp;&amp;__showtoolbar__=false" overflowx="false" overflowy="false"/>
<Parameters/>
</InnerWidget>
<BoundsAttr x="-22" y="50" width="796" height="676"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.FreeButton">
<Listener event="click">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters>
<Parameter>
<Attributes name="season"/>
<O>
<![CDATA[1]]></O>
</Parameter>
</Parameters>
<Content>
<![CDATA[var area = this.options.form.getWidgetByName("area").getValue();
this.options.form.getWidgetByName("iframeEditor1").setValue("${servletURL}?reportlet=demo/analytics/business.cpt&__showtoolbar__=false&season=1&province="+FR.cjkEncode(area));
this.options.form.getWidgetByName("iframeEditor2").setValue("${servletURL}?reportlet=demo/analytics/light.cpt&__showtoolbar__=false&season=1&province="+FR.cjkEncode(area));]]></Content>
</JavaScript>
</Listener>
<WidgetName name="button0"/>
<WidgetAttr/>
<Text>
<![CDATA[一季度]]></Text>
</InnerWidget>
<BoundsAttr x="734" y="20" width="68" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.FreeButton">
<Listener event="click">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters>
<Parameter>
<Attributes name="season"/>
<O>
<![CDATA[2]]></O>
</Parameter>
</Parameters>
<Content>
<![CDATA[var area = this.options.form.getWidgetByName("area").getValue();
this.options.form.getWidgetByName("iframeEditor1").setValue("${servletURL}?reportlet=demo/analytics/business.cpt&__showtoolbar__=false&season=2&province="+FR.cjkEncode(area));
this.options.form.getWidgetByName("iframeEditor2").setValue("${servletURL}?reportlet=demo/analytics/light.cpt&__showtoolbar__=false&season=2&province="+FR.cjkEncode(area));]]></Content>
</JavaScript>
</Listener>
<WidgetName name="button1"/>
<WidgetAttr/>
<Text>
<![CDATA[二季度]]></Text>
</InnerWidget>
<BoundsAttr x="824" y="20" width="68" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.FreeButton">
<Listener event="click">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters>
<Parameter>
<Attributes name="season"/>
<O>
<![CDATA[3]]></O>
</Parameter>
</Parameters>
<Content>
<![CDATA[var area = this.options.form.getWidgetByName("area").getValue();
this.options.form.getWidgetByName("iframeEditor1").setValue("${servletURL}?reportlet=demo/analytics/business.cpt&__showtoolbar__=false&season=3&province="+FR.cjkEncode(area));
this.options.form.getWidgetByName("iframeEditor2").setValue("${servletURL}?reportlet=demo/analytics/light.cpt&__showtoolbar__=false&season=3&province="+FR.cjkEncode(area));]]></Content>
</JavaScript>
</Listener>
<WidgetName name="button2"/>
<WidgetAttr/>
<Text>
<![CDATA[三季度]]></Text>
</InnerWidget>
<BoundsAttr x="912" y="20" width="68" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.FreeButton">
<Listener event="click">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters>
<Parameter>
<Attributes name="season"/>
<O>
<![CDATA[4]]></O>
</Parameter>
</Parameters>
<Content>
<![CDATA[var area = this.options.form.getWidgetByName("area").getValue();
this.options.form.getWidgetByName("iframeEditor1").setValue("${servletURL}?reportlet=demo/analytics/business.cpt&__showtoolbar__=false&season=4&province="+FR.cjkEncode(area));
this.options.form.getWidgetByName("iframeEditor2").setValue("${servletURL}?reportlet=demo/analytics/light.cpt&__showtoolbar__=false&season=4&province="+FR.cjkEncode(area));]]></Content>
</JavaScript>
</Listener>
<WidgetName name="button3"/>
<WidgetAttr/>
<Text>
<![CDATA[四季度]]></Text>
</InnerWidget>
<BoundsAttr x="1000" y="19" width="66" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.IframeEditor">
<WidgetName name="iframeEditor1"/>
<WidgetAttr/>
<Iframe src="${servletURL}?reportlet=demo/analytics/business.cpt&amp;&amp;__showtoolbar__=false" overflowx="false" overflowy="false"/>
<Parameters/>
</InnerWidget>
<BoundsAttr x="689" y="56" width="698" height="623"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.TextEditor">
<WidgetName name="area"/>
<WidgetAttr invisible="true"/>
<TextAttr/>
<widgetValue>
<O>
<![CDATA[上海市]]></O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="107" y="312" width="80" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.IframeEditor">
<WidgetName name="iframeEditor2"/>
<WidgetAttr/>
<Iframe src="${servletURL}?reportlet=demo/analytics/light.cpt&amp;&amp;__showtoolbar__=false" overflowx="true" overflowy="true"/>
<Parameters/>
</InnerWidget>
<BoundsAttr x="28" y="35" width="622" height="39"/>
</Widget>
<LCAttr vgap="0" hgap="0"/>
</Layout>
<DesignerVersion DesignerVersion="HAE"/>
<PreviewType PreviewType="0"/>
</Form>
