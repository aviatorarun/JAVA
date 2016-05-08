<?xml version="1.0" encoding="UTF-8"?>
<report xmlns="http://www.eclipse.org/birt/2005/design" version="3.2.22" id="1">
    <property name="comments">IBM Confidential

OCO Source Materials

5724-M19

(C) COPYRIGHT IBM CORP. 2006

The source code for this program is not published or otherwise
divested of its trade secrets, irrespective of what has been
deposited with the U.S. Copyright Office.

09-19764@000</property>
    <property name="createdBy">Eclipse BIRT Designer Version 3.7.1.v20110905 Build &lt;3.7.1.v20110913-1734></property>
    <html-property name="description">This template will create a report having a single header with multiple rows of data.</html-property>
    <property name="units">in</property>
    <method name="initialize"><![CDATA[importPackage(Packages.com.ibm.tivoli.maximo.report.script);

mxReportScriptContext = MXReportScriptContext.initialize(reportContext);
mxReportScriptContext.setDefaultLogLevel("DEBUG");
mxReportScriptContext.setDefaultLogFile("C:/temp/budgetallocation.log");

scriptLogger = mxReportScriptContext.getReportScriptLogger();


]]></method>
    <method name="beforeFactory"><![CDATA[// Remove page break intervals from PDF output
if ( (reportContext.getParameterValue("usepagebreaks") == "false")|| reportContext.getOutputFormat() == "pdf" ) {
	// Give each table in the report a name, and add the names to the list below, e.g. ["mainTable", "childTable1"]
	var tableListing = ["mainTable"];
	for each(var tableName in tableListing) {
		var table = reportContext.getReportRunnable().designHandle.getDesignHandle().findElement(tableName)
		if (table != null)
		{
			table.setProperty("pageBreakInterval", 0);
		}
	}
}]]></method>
    <method name="afterFactory"><![CDATA[MXReportScriptContext.close();]]></method>
    <property name="theme">MaximoSystemLibrary.maximoTheme</property>
    <text-property name="displayName">Tivoli Maximo List Template</text-property>
    <property name="layoutPreference">auto layout</property>
    <property name="bidiLayoutOrientation">ltr</property>
    <property name="imageDPI">96</property>
    <list-property name="libraries">
        <structure>
            <property name="fileName">MaximoSystemLibrary.rptlibrary</property>
            <property name="namespace">MaximoSystemLibrary</property>
        </structure>
    </list-property>
    <template-parameter-definitions>
        <template-parameter-definition name="NewTemplateParameterDefinition" id="71">
            <property name="allowedType">Label</property>
            <text-property name="description">Double-click to enter the report title.</text-property>
            <default>
                <label id="72">
                    <text-property name="text">Report Title</text-property>
                </label>
            </default>
        </template-parameter-definition>
    </template-parameter-definitions>
    <parameters>
        <scalar-parameter name="where" id="25">
            <property name="valueType">static</property>
            <property name="isRequired">false</property>
            <property name="dataType">string</property>
            <simple-property-list name="defaultValue">
                <value type="constant">1=1</value>
            </simple-property-list>
            <property name="controlType">text-box</property>
            <structure name="format">
                <property name="category">Unformatted</property>
            </structure>
        </scalar-parameter>
        <scalar-parameter name="appname" id="200">
            <property name="valueType">static</property>
            <property name="isRequired">false</property>
            <property name="dataType">string</property>
            <property name="controlType">text-box</property>
            <structure name="format">
                <property name="category">Unformatted</property>
            </structure>
        </scalar-parameter>
        <scalar-parameter name="paramdelimiter" id="202">
            <property name="hidden">true</property>
            <property name="valueType">static</property>
            <property name="isRequired">false</property>
            <property name="dataType">string</property>
            <property name="controlType">text-box</property>
            <structure name="format">
                <property name="category">Unformatted</property>
            </structure>
        </scalar-parameter>
        <scalar-parameter name="paramstring" id="201">
            <property name="hidden">true</property>
            <property name="valueType">static</property>
            <property name="isRequired">false</property>
            <property name="dataType">string</property>
            <property name="controlType">text-box</property>
            <structure name="format">
                <property name="category">Unformatted</property>
            </structure>
        </scalar-parameter>
        <scalar-parameter name="usepagebreaks" id="342">
            <property name="hidden">true</property>
            <property name="valueType">static</property>
            <property name="isRequired">false</property>
            <property name="dataType">string</property>
            <property name="distinct">true</property>
            <simple-property-list name="defaultValue">
                <value type="constant">true</value>
            </simple-property-list>
            <property name="paramType">simple</property>
            <property name="controlType">text-box</property>
            <structure name="format">
                <property name="category">Unformatted</property>
            </structure>
        </scalar-parameter>
    </parameters>
    <data-sources>
        <script-data-source name="maximoDataSource" id="64" extends="MaximoSystemLibrary.maximoDataSource"/>
    </data-sources>
    <data-sets>
        <script-data-set name="dataSet" id="5">
            <property name="newHandlerOnEachEvent">false</property>
            <list-property name="resultSetHints">
                <structure>
                    <property name="position">1</property>
                    <property name="name">location</property>
                    <property name="dataType">string</property>
                </structure>
                <structure>
                    <property name="position">2</property>
                    <property name="name">invcost</property>
                    <property name="dataType">decimal</property>
                </structure>
                <structure>
                    <property name="position">3</property>
                    <property name="name">rectcost</property>
                    <property name="dataType">decimal</property>
                </structure>
                <structure>
                    <property name="position">4</property>
                    <property name="name">materialapicost</property>
                    <property name="dataType">decimal</property>
                </structure>
                <structure>
                    <property name="position">5</property>
                    <property name="name">outsideserivcecost</property>
                    <property name="dataType">decimal</property>
                </structure>
                <structure>
                    <property name="position">6</property>
                    <property name="name">procardcost</property>
                    <property name="dataType">decimal</property>
                </structure>
                <structure>
                    <property name="position">7</property>
                    <property name="name">currentplan</property>
                    <property name="dataType">decimal</property>
                </structure>
                <structure>
                    <property name="position">8</property>
                    <property name="name">csxdivision</property>
                    <property name="dataType">string</property>
                </structure>
                <structure>
                    <property name="position">9</property>
                    <property name="name">region</property>
                    <property name="dataType">string</property>
                </structure>
                <structure>
                    <property name="position">10</property>
                    <property name="name">CSXRDWYPERIOD</property>
                    <property name="dataType">date</property>
                </structure>
                <structure>
                    <property name="position">11</property>
                    <property name="name">CSXRDWYFYEAR</property>
                    <property name="dataType">string</property>
                </structure>
                <structure>
                    <property name="position">12</property>
                    <property name="name">CSXRDWYPDMONTH</property>
                    <property name="dataType">string</property>
                </structure>
            </list-property>
            <list-property name="columnHints">
                <structure>
                    <property name="columnName">location</property>
                </structure>
                <structure>
                    <property name="columnName">invcost</property>
                </structure>
                <structure>
                    <property name="columnName">rectcost</property>
                </structure>
                <structure>
                    <property name="columnName">materialapicost</property>
                </structure>
                <structure>
                    <property name="columnName">outsideserivcecost</property>
                </structure>
                <structure>
                    <property name="columnName">procardcost</property>
                </structure>
                <structure>
                    <property name="columnName">currentplan</property>
                </structure>
                <structure>
                    <property name="columnName">csxdivision</property>
                </structure>
                <structure>
                    <property name="columnName">region</property>
                </structure>
                <structure>
                    <property name="columnName">CSXRDWYPERIOD</property>
                </structure>
                <structure>
                    <property name="columnName">CSXRDWYFYEAR</property>
                </structure>
                <structure>
                    <property name="columnName">CSXRDWYPDMONTH</property>
                </structure>
            </list-property>
            <structure name="cachedMetaData">
                <list-property name="resultSet">
                    <structure>
                        <property name="position">1</property>
                        <property name="name">location</property>
                        <property name="dataType">string</property>
                    </structure>
                    <structure>
                        <property name="position">2</property>
                        <property name="name">invcost</property>
                        <property name="dataType">decimal</property>
                    </structure>
                    <structure>
                        <property name="position">3</property>
                        <property name="name">rectcost</property>
                        <property name="dataType">decimal</property>
                    </structure>
                    <structure>
                        <property name="position">4</property>
                        <property name="name">materialapicost</property>
                        <property name="dataType">decimal</property>
                    </structure>
                    <structure>
                        <property name="position">5</property>
                        <property name="name">outsideserivcecost</property>
                        <property name="dataType">decimal</property>
                    </structure>
                    <structure>
                        <property name="position">6</property>
                        <property name="name">procardcost</property>
                        <property name="dataType">decimal</property>
                    </structure>
                    <structure>
                        <property name="position">7</property>
                        <property name="name">currentplan</property>
                        <property name="dataType">decimal</property>
                    </structure>
                    <structure>
                        <property name="position">8</property>
                        <property name="name">csxdivision</property>
                        <property name="dataType">string</property>
                    </structure>
                    <structure>
                        <property name="position">9</property>
                        <property name="name">region</property>
                        <property name="dataType">string</property>
                    </structure>
                    <structure>
                        <property name="position">10</property>
                        <property name="name">CSXRDWYPERIOD</property>
                        <property name="dataType">date</property>
                    </structure>
                    <structure>
                        <property name="position">11</property>
                        <property name="name">CSXRDWYFYEAR</property>
                        <property name="dataType">string</property>
                    </structure>
                    <structure>
                        <property name="position">12</property>
                        <property name="name">CSXRDWYPDMONTH</property>
                        <property name="dataType">string</property>
                    </structure>
                </list-property>
            </structure>
            <property name="needsCache">false</property>
            <property name="dataSource">maximoDataSource</property>
            <method name="open"><![CDATA[maximoDataSet = MXReportDataSetProvider.create(this.getDataSource().getName(), this.getName());
maximoDataSet.open();

	


scriptLogger.debug(" param where "+params["where"]);

var sqlText = new String();

// Add query to sqlText variable.
sqlText = 
//"select textfield, datefield from table"
// Include the Maximo where clause
 //"   select distinct loch.location as region,loc.csxdivision,rdwybd.currentplan,loch.location as location  "
"   select distinct loc.location as region,loc.csxdivision,nvl(rdwybd.currentplan,0) as currentplan ,loch.location ,CSXRDWYBUDGET.CSXRDWYFYEAR,CSXRDWYBUDGET.CSXRDWYPDMONTH,CSXRDWYBUDGET.CSXRDWYPERIOD "

// ,"
// + "   (select sum(nvl(inv.burdened_cost_a,0)) from  csx_roadway_machines_new_mv inv where   "  
 // + "   inv.task_number_i in (SELECT distinct mach.csxpurposecode FROM  asset mach WHERE  mach.parent is null and mach.csxdepartment='ROADWAYS' and mach.location  =loc.location and  mach.siteid='CSXEAM') "
 // + "   and  inv.project_number_i = 'OE0220' and  "+params["where1"]+" ) as invcost, "
    
//  + "   (select sum(nvl(recp.detail_a,0)) from   csx_roadway_receipts_mv recp where  "
//  + "    recp.task_number_i in (SELECT distinct mach.CSXPURPOSECODE FROM asset mach WHERE  mach.parent is null and mach.csxdepartment='ROADWAYS' and mach.location  =loc.location and mach.siteid='CSXEAM') "
//  + "    and  recp.project_number_i = 'OE0220' and  "+params["where1"]+" ) rectcost, "
  
//  + " (select TO_CHAR(SUM(detail_a),'FM9,999,990.00') cost_a  FROM  csx_roadway_projacct_mv where "
//   + "  task_number_i  IN(SELECT mach.csxpurposecode FROM asset mach WHERE              mach.parent is null and mach.csxdepartment='ROADWAYS'  and  mach.location  =loc.location  and mach.siteid='CSXEAM')  "
//  + "    AND "+params["where1"]+" AND je_source_c = 'Payables' AND  source_x != 'PROCARD' AND (po_distribution_i IS NULL OR invoice_price_variance_a = detail_a ) " 
//   + "   AND expenditure_type_c NOT  LIKE 'OS%' AND expenditure_type_c != 'FREIGHT-VENDORS') as materialapicost, "
    
//   + "   (SELECT SUM(nvl(detail_a,0)) cost_a  FROM csx_roadway_projacct_mv where "
//   + "   task_number_i in (SELECT mach.csxpurposecode FROM asset mach WHERE   mach.parent is null and  mach.csxdepartment='ROADWAYS' and mach.location  =loc.location and  mach.siteid='CSXEAM'   ) "

//  + " AND "+params["where1"]+" AND je_source_c = 'Payables' AND (po_distribution_i IS NULL OR invoice_price_variance_a = detail_a) "
// + " AND expenditure_type_c LIKE 'OS%' AND expenditure_type_c != 'FREIGHT-VENDORS') as outsideserivcecost, "
 
// + " (SELECT sum(nvl(cc.detail_a,0)) FROM csx_roadway_machines_mv cc ,csxrdwyproassign pc WHERE    "+params["where1"]+"  AND cc.je_source_c = 'Payables'  AND  cc.expenditure_type_c = 'MTL-PROCUREMENT CARD' AND (cc.po_distribution_i IS NULL OR cc.invoice_price_variance_a = cc.detail_a) AND cc.expenditure_type_c NOT LIKE 'OS%'  AND  "

// + " cc.expenditure_type_c != 'FREIGHT-VENDORS' and cc.invoice_i=pc.csxrdwyprocard(+) and pc.CSXRDWYASSIGNCODE  =loc.location ) as procardcost "
     
 
  + "   from  locations loc ,CSXRDWYBDGDETAILS rdwybd ,lochierarchy loch ,CSXRDWYBUDGET CSXRDWYBUDGET"
    
//  + "     where "
  
  + " where " + params["where"]
 + " and  loc.classstructureid in (select classstructureid from classstructure where classificationid='REGION') and "
  + " rdwybd.DIVORTEAM=loc.location and  rdwybd.CSXRDWYBUDGETID =CSXRDWYBUDGET.CSXRDWYBUDGETID "
  
 // in (select CSXRDWYBUDGETID from CSXRDWYBUDGET where CSXRDWYFYEAR ='"+params["year"]+"' and CSXRDWYPDMONTH='"+params["period"]+"') "
 // + "   loc.CSXRDWYBUDGET=1  and "
 //+ "  loc.CSXDIVISION ='SYT' and loc.location in ('T1','T2','T3','T4','T5','T6','T7','T8','T9') and  loc.csxdepartment='ROADWAYS' "
  + " and loc.siteid='CSXEAM' and loc.location=loch.parent(+) "
   //+ "  loc.CSXDIVISION ='SYT' and loc.location in ('T1','T2','T3','T4','T5','T6','T7','T8','T9','C1','C2','C3','C4','C5','C6','C7','R1','R2','S1','S2') and  loc.csxdepartment='ROADWAYS' and loc.siteid='CSXEAM' "
    
  // + "  and   ((loc.classstructureid not in (select classstructureid from classstructure where classificationid='REGION')) or loc.classstructureid is null) "
   
   
 // + "  group by loc.location order by loc.location"
    
    
    
    


//+ " where " + params["where"]
;

maximoDataSet.setQuery(sqlText);]]></method>
            <method name="fetch"><![CDATA[if (!maximoDataSet.fetch())
	return (false);

// Add a line for each output column
// The specific get method should match the data type of the output column.
row["location"] = maximoDataSet.getString("location");	
row["currentplan"] = maximoDataSet.getDouble("currentplan");	
row["csxdivision"] = maximoDataSet.getString("csxdivision");
row["region"] = maximoDataSet.getString("region");	4

row["CSXRDWYFYEAR"] = maximoDataSet.getString("CSXRDWYFYEAR");
row["CSXRDWYPDMONTH"] = maximoDataSet.getString("CSXRDWYPDMONTH");
row["CSXRDWYPERIOD"] = maximoDataSet.getTimestamp("CSXRDWYPERIOD");


if(row["currentplan"]==0)
{
row["currentplan"]=0.0001;
}

params["where1"]="1=1";

	params["where1"]=params["where1"]+ " and FISCAL_YEAR_C like '"+row["CSXRDWYFYEAR"]+"'"

 	
	params["where1"]=params["where1"]+  " and FISCAL_PERIOD_C like '"+row["CSXRDWYPDMONTH"]+"'"

	




if (row["location"]!=null)
{


// invcost 
	invcostDataSet = MXReportDataSetProvider.create(this.getDataSource().getName(), "invcostDataSet");
	invcostDataSet.open();
	
	invcostSQL =
	" (select sum(nvl(inv.burdened_cost_a,0)) as invcost from  csx_roadway_machines_new_mv inv where   "  
  + "   inv.task_number_i in (SELECT distinct mach.csxpurposecode FROM  asset mach,lochierarchy loch WHERE  mach.parent is null and mach.csxdepartment='ROADWAYS' and mach.location=loch.location and  loch.parent='"+row["location"]+"' and  mach.siteid='CSXEAM') "
  + "   and  inv.project_number_i = 'OE0220' and  "+params["where1"]+" ) "
	
	

		
	invcostDataSet.setQuery(invcostSQL);

	if(invcostDataSet.fetch()) {
		
		row["invcost"] = invcostDataSet.getDouble("invcost");
	}
	
	invcostDataSet.close();
// invcost


// rectcost 
	rectcostDataSet = MXReportDataSetProvider.create(this.getDataSource().getName(), "rectcostDataSet");
	rectcostDataSet.open();
	
	rectcostSQL =
"   (select sum(nvl(recp.detail_a,0)) as rectcost from   csx_roadway_receipts_mv recp where  "
  + "    recp.task_number_i in (SELECT distinct mach.CSXPURPOSECODE FROM asset mach,lochierarchy loch WHERE  mach.parent is null and mach.csxdepartment='ROADWAYS' and mach.location=loch.location and  loch.parent='"+row["location"]+"' and mach.siteid='CSXEAM') "
  + "    and  recp.project_number_i = 'OE0220' and  "+params["where1"]+" )  "
	
	

		
	rectcostDataSet.setQuery(rectcostSQL);

	if(rectcostDataSet.fetch()) {
		
		row["rectcost"] = rectcostDataSet.getDouble("rectcost");
	}
	
	rectcostDataSet.close();
// rectcost



// materialapicost 
	materialapicostDataSet = MXReportDataSetProvider.create(this.getDataSource().getName(), "materialapicostDataSet");
	materialapicostDataSet.open();
	
	materialapicostSQL =

 " (select SUM(nvl(detail_a,0)) materialapicost  FROM  csx_roadway_projacct_mv where "
  + "  task_number_i  IN(SELECT mach.csxpurposecode FROM asset mach,lochierarchy loch WHERE  mach.parent is null and mach.csxdepartment='ROADWAYS'  and  mach.location=loch.location and  loch.parent='"+row["location"]+"'  and mach.siteid='CSXEAM')  "
  + "    AND "+params["where1"]+" AND je_source_c = 'Payables' AND  source_x != 'PROCARD' AND (po_distribution_i IS NULL OR invoice_price_variance_a = detail_a ) " 
  + "   AND expenditure_type_c NOT  LIKE 'OS%' AND expenditure_type_c != 'FREIGHT-VENDORS')  "
	
	

		
	materialapicostDataSet.setQuery(materialapicostSQL);

	if(materialapicostDataSet.fetch()) {
		
		row["materialapicost"] = materialapicostDataSet.getDouble("materialapicost");
	}
	
	materialapicostDataSet.close();
// materialapicost


// outsideserivcecost 
	outsideserivcecostDataSet = MXReportDataSetProvider.create(this.getDataSource().getName(), "outsideserivcecostDataSet");
	outsideserivcecostDataSet.open();
	
	outsideserivcecostSQL =

 "   (SELECT SUM(nvl(detail_a,0)) as outsideserivcecost  FROM csx_roadway_projacct_mv where "
 + "   task_number_i in (SELECT mach.csxpurposecode FROM asset mach,lochierarchy loch WHERE   mach.parent is null and  mach.csxdepartment='ROADWAYS' and mach.location=loch.location and  loch.parent='"+row["location"]+"'  and  mach.siteid='CSXEAM'   ) "

 + " and "+params["where1"]+" AND je_source_c = 'Payables' AND (po_distribution_i IS NULL OR invoice_price_variance_a = detail_a) "
 + " and expenditure_type_c LIKE 'OS%' AND expenditure_type_c != 'FREIGHT-VENDORS') "
	
	

		
	outsideserivcecostDataSet.setQuery(outsideserivcecostSQL);

	if(outsideserivcecostDataSet.fetch()) {
		
		row["outsideserivcecost"] = outsideserivcecostDataSet.getDouble("outsideserivcecost");
	}
	
	outsideserivcecostDataSet.close();
// outsideserivcecost


// procardcost 
	procardcostDataSet = MXReportDataSetProvider.create(this.getDataSource().getName(), "procardcostDataSet");
	procardcostDataSet.open();
	
	procardcostSQL =

 " (SELECT sum(nvl(cc.detail_a,0)) as procardcost FROM csx_roadway_machines_mv cc ,csxrdwyproassign pc,lochierarchy loch WHERE    "+params["where1"]+"  AND cc.je_source_c = 'Payables'  AND  cc.expenditure_type_c = 'MTL-PROCUREMENT CARD' AND (cc.po_distribution_i IS NULL OR cc.invoice_price_variance_a = cc.detail_a) AND cc.expenditure_type_c NOT LIKE 'OS%'  AND  "

 + " cc.expenditure_type_c != 'FREIGHT-VENDORS' and cc.invoice_i=pc.csxrdwyprocard(+) and pc.CSXRDWYASSIGNCODE  =loch.location and loch.parent='"+row["location"]+"' )  "

	
	

		
	procardcostDataSet.setQuery(procardcostSQL);

	if(procardcostDataSet.fetch()) {
		
		row["procardcost"] = procardcostDataSet.getDouble("procardcost");
	}
	
	procardcostDataSet.close();
// materialapicost


}






return (true);]]></method>
        </script-data-set>
        <script-data-set name="SYTDataSet" id="670">
            <list-property name="resultSetHints">
                <structure>
                    <property name="position">1</property>
                    <property name="name">location</property>
                    <property name="dataType">string</property>
                </structure>
                <structure>
                    <property name="position">2</property>
                    <property name="name">currentplan</property>
                    <property name="dataType">decimal</property>
                </structure>
                <structure>
                    <property name="position">3</property>
                    <property name="name">csxdivision</property>
                    <property name="dataType">string</property>
                </structure>
                <structure>
                    <property name="position">4</property>
                    <property name="name">invcost</property>
                    <property name="dataType">decimal</property>
                </structure>
                <structure>
                    <property name="position">5</property>
                    <property name="name">rectcost</property>
                    <property name="dataType">decimal</property>
                </structure>
                <structure>
                    <property name="position">6</property>
                    <property name="name">materialapicost</property>
                    <property name="dataType">decimal</property>
                </structure>
                <structure>
                    <property name="position">7</property>
                    <property name="name">outsideserivcecost</property>
                    <property name="dataType">decimal</property>
                </structure>
                <structure>
                    <property name="position">8</property>
                    <property name="name">procardcost</property>
                    <property name="dataType">decimal</property>
                </structure>
                <structure>
                    <property name="position">9</property>
                    <property name="name">CSXRDWYFYEAR</property>
                    <property name="dataType">string</property>
                </structure>
                <structure>
                    <property name="position">10</property>
                    <property name="name">CSXRDWYPDMONTH</property>
                    <property name="dataType">string</property>
                </structure>
                <structure>
                    <property name="position">11</property>
                    <property name="name">CSXRDWYPERIOD</property>
                    <property name="dataType">string</property>
                </structure>
                <structure>
                    <property name="position">12</property>
                    <property name="name">description</property>
                    <property name="dataType">string</property>
                </structure>
            </list-property>
            <list-property name="columnHints">
                <structure>
                    <property name="columnName">location</property>
                </structure>
                <structure>
                    <property name="columnName">currentplan</property>
                </structure>
                <structure>
                    <property name="columnName">csxdivision</property>
                </structure>
                <structure>
                    <property name="columnName">invcost</property>
                </structure>
                <structure>
                    <property name="columnName">rectcost</property>
                </structure>
                <structure>
                    <property name="columnName">materialapicost</property>
                </structure>
                <structure>
                    <property name="columnName">outsideserivcecost</property>
                </structure>
                <structure>
                    <property name="columnName">procardcost</property>
                </structure>
                <structure>
                    <property name="columnName">CSXRDWYFYEAR</property>
                </structure>
                <structure>
                    <property name="columnName">CSXRDWYPDMONTH</property>
                </structure>
                <structure>
                    <property name="columnName">CSXRDWYPERIOD</property>
                </structure>
                <structure>
                    <property name="columnName">description</property>
                </structure>
            </list-property>
            <structure name="cachedMetaData">
                <list-property name="resultSet">
                    <structure>
                        <property name="position">1</property>
                        <property name="name">location</property>
                        <property name="dataType">string</property>
                    </structure>
                    <structure>
                        <property name="position">2</property>
                        <property name="name">currentplan</property>
                        <property name="dataType">decimal</property>
                    </structure>
                    <structure>
                        <property name="position">3</property>
                        <property name="name">csxdivision</property>
                        <property name="dataType">string</property>
                    </structure>
                    <structure>
                        <property name="position">4</property>
                        <property name="name">invcost</property>
                        <property name="dataType">decimal</property>
                    </structure>
                    <structure>
                        <property name="position">5</property>
                        <property name="name">rectcost</property>
                        <property name="dataType">decimal</property>
                    </structure>
                    <structure>
                        <property name="position">6</property>
                        <property name="name">materialapicost</property>
                        <property name="dataType">decimal</property>
                    </structure>
                    <structure>
                        <property name="position">7</property>
                        <property name="name">outsideserivcecost</property>
                        <property name="dataType">decimal</property>
                    </structure>
                    <structure>
                        <property name="position">8</property>
                        <property name="name">procardcost</property>
                        <property name="dataType">decimal</property>
                    </structure>
                    <structure>
                        <property name="position">9</property>
                        <property name="name">CSXRDWYFYEAR</property>
                        <property name="dataType">string</property>
                    </structure>
                    <structure>
                        <property name="position">10</property>
                        <property name="name">CSXRDWYPDMONTH</property>
                        <property name="dataType">string</property>
                    </structure>
                    <structure>
                        <property name="position">11</property>
                        <property name="name">CSXRDWYPERIOD</property>
                        <property name="dataType">string</property>
                    </structure>
                    <structure>
                        <property name="position">12</property>
                        <property name="name">description</property>
                        <property name="dataType">string</property>
                    </structure>
                </list-property>
            </structure>
            <property name="dataSource">maximoDataSource</property>
            <method name="open"><![CDATA[maximoDataSYTSet = MXReportDataSetProvider.create(this.getDataSource().getName(), this.getName());
maximoDataSYTSet.open();



scriptLogger.debug(" param where "+params["where"]);

var sqlText = new String();

// Add query to sqlText variable.
sqlText = 
//"select textfield, datefield from table"
// Include the Maximo where clause
 "   select distinct loc.location,loc.description,loc.csxdivision,nvl(rdwybd.currentplan,0) as currentplan,CSXRDWYBUDGET.CSXRDWYFYEAR,CSXRDWYBUDGET.CSXRDWYPDMONTH,CSXRDWYBUDGET.CSXRDWYPERIOD  "

// ,"
// + "   (select sum(nvl(inv.burdened_cost_a,0)) from  csx_roadway_machines_new_mv inv where   "  
 // + "   inv.task_number_i in (SELECT distinct mach.csxpurposecode FROM  asset mach WHERE  mach.parent is null and mach.csxdepartment='ROADWAYS' and mach.location  =loc.location and  mach.siteid='CSXEAM') "
 // + "   and  inv.project_number_i = 'OE0220' and  "+params["where1"]+" ) as invcost, "
    
//  + "   (select sum(nvl(recp.detail_a,0)) from   csx_roadway_receipts_mv recp where  "
//  + "    recp.task_number_i in (SELECT distinct mach.CSXPURPOSECODE FROM asset mach WHERE  mach.parent is null and mach.csxdepartment='ROADWAYS' and mach.location  =loc.location and mach.siteid='CSXEAM') "
//  + "    and  recp.project_number_i = 'OE0220' and  "+params["where1"]+" ) rectcost, "
  
//  + " (select TO_CHAR(SUM(detail_a),'FM9,999,990.00') cost_a  FROM  csx_roadway_projacct_mv where "
//   + "  task_number_i  IN(SELECT mach.csxpurposecode FROM asset mach WHERE              mach.parent is null and mach.csxdepartment='ROADWAYS'  and  mach.location  =loc.location  and mach.siteid='CSXEAM')  "
//  + "    AND "+params["where1"]+" AND je_source_c = 'Payables' AND  source_x != 'PROCARD' AND (po_distribution_i IS NULL OR invoice_price_variance_a = detail_a ) " 
//   + "   AND expenditure_type_c NOT  LIKE 'OS%' AND expenditure_type_c != 'FREIGHT-VENDORS') as materialapicost, "
    
//   + "   (SELECT SUM(nvl(detail_a,0)) cost_a  FROM csx_roadway_projacct_mv where "
//   + "   task_number_i in (SELECT mach.csxpurposecode FROM asset mach WHERE   mach.parent is null and  mach.csxdepartment='ROADWAYS' and mach.location  =loc.location and  mach.siteid='CSXEAM'   ) "

//  + " AND "+params["where1"]+" AND je_source_c = 'Payables' AND (po_distribution_i IS NULL OR invoice_price_variance_a = detail_a) "
// + " AND expenditure_type_c LIKE 'OS%' AND expenditure_type_c != 'FREIGHT-VENDORS') as outsideserivcecost, "
 
// + " (SELECT sum(nvl(cc.detail_a,0)) FROM csx_roadway_machines_mv cc ,csxrdwyproassign pc WHERE    "+params["where1"]+"  AND cc.je_source_c = 'Payables'  AND  cc.expenditure_type_c = 'MTL-PROCUREMENT CARD' AND (cc.po_distribution_i IS NULL OR cc.invoice_price_variance_a = cc.detail_a) AND cc.expenditure_type_c NOT LIKE 'OS%'  AND  "

// + " cc.expenditure_type_c != 'FREIGHT-VENDORS' and cc.invoice_i=pc.csxrdwyprocard(+) and pc.CSXRDWYASSIGNCODE  =loc.location ) as procardcost "
     
 
  + "   from  locations loc ,CSXRDWYBDGDETAILS rdwybd ,CSXRDWYBUDGET CSXRDWYBUDGET"
  + " where " + params["where"]
 // + "     where  "
  + " and loc.CSXDIVISION in ('SYT') and "
  + " rdwybd.DIVORTEAM=loc.location and rdwybd.CSXRDWYBUDGETID =CSXRDWYBUDGET.CSXRDWYBUDGETID "
  
  
 //  CSXRDWYBUDGETID=(select CSXRDWYBUDGETID from CSXRDWYBUDGET where CSXRDWYFYEAR ='"+params["year"]+"' and CSXRDWYPDMONTH='"+params["period"]+"') "
 // + "   loc.CSXRDWYBUDGET=1  and "
 //+ "  loc.CSXDIVISION ='SYT' and loc.location in ('T1','T2','T3','T4','T5','T6','T7','T8','T9') and  loc.csxdepartment='ROADWAYS' "
  + " and loc.siteid='CSXEAM' "
   //+ "  loc.CSXDIVISION ='SYT' and loc.location in ('T1','T2','T3','T4','T5','T6','T7','T8','T9','C1','C2','C3','C4','C5','C6','C7','R1','R2','S1','S2') and  loc.csxdepartment='ROADWAYS' and loc.siteid='CSXEAM' "
    
  // + "  and   ((loc.classstructureid not in (select classstructureid from classstructure where classificationid='REGION')) or loc.classstructureid is null) "
   
   
 // + "  group by loc.location order by loc.location"
    
    
    
    


//+ " where " + params["where"]
;

maximoDataSYTSet.setQuery(sqlText);]]></method>
            <method name="fetch"><![CDATA[if (!maximoDataSYTSet.fetch())
	return (false);

// Add a line for each output column
// The specific get method should match the data type of the output column.
row["location"] = maximoDataSYTSet.getString("location");	
row["currentplan"] = maximoDataSYTSet.getDouble("currentplan");	
row["csxdivision"] = maximoDataSYTSet.getString("csxdivision");	

row["CSXRDWYFYEAR"] = maximoDataSYTSet.getString("CSXRDWYFYEAR");
row["CSXRDWYPDMONTH"] = maximoDataSYTSet.getString("CSXRDWYPDMONTH");
row["CSXRDWYPERIOD"] = maximoDataSYTSet.getString("CSXRDWYPERIOD");
row["description"] = maximoDataSYTSet.getString("description");


if(row["currentplan"]==0)
{
row["currentplan"]=0.0001;
}




params["where1"]="1=1";

	params["where1"]=params["where1"]+ " and FISCAL_YEAR_C like '"+row["CSXRDWYFYEAR"]+"'"

 	
	params["where1"]=params["where1"]+  " and FISCAL_PERIOD_C like '"+row["CSXRDWYPDMONTH"]+"'"






// invcost 
	invcostDataSYTSet = MXReportDataSetProvider.create(this.getDataSource().getName(), "invcostDataSYTSet");
	invcostDataSYTSet.open();
	
	invcostSQL =
	" (select sum(nvl(inv.burdened_cost_a,0)) as invcost from  csx_roadway_machines_new_mv inv where   "  
  + "   inv.task_number_i in (SELECT distinct mach.csxpurposecode FROM  asset mach WHERE  mach.parent is null and mach.csxdepartment='ROADWAYS' and mach.location  ='"+row["location"]+"' and  mach.siteid='CSXEAM') "
  + "   and  inv.project_number_i = 'OE0220' and  "+params["where1"]+" ) "
	
	

		
	invcostDataSYTSet.setQuery(invcostSQL);

	if(invcostDataSYTSet.fetch()) {
		
		row["invcost"] = invcostDataSYTSet.getDouble("invcost");
	}
	
	invcostDataSYTSet.close();
// invcost


// rectcost 
	rectcostDataSYTSet = MXReportDataSetProvider.create(this.getDataSource().getName(), "rectcostDataSYTSet");
	rectcostDataSYTSet.open();
	
	rectcostSQL =
"   (select sum(nvl(recp.detail_a,0)) as rectcost from   csx_roadway_receipts_mv recp where  "
  + "    recp.task_number_i in (SELECT distinct mach.CSXPURPOSECODE FROM asset mach WHERE  mach.parent is null and mach.csxdepartment='ROADWAYS' and mach.location   ='"+row["location"]+"' and mach.siteid='CSXEAM') "
  + "    and  recp.project_number_i = 'OE0220' and  "+params["where1"]+" )  "
	
	

		
	rectcostDataSYTSet.setQuery(rectcostSQL);

	if(rectcostDataSYTSet.fetch()) {
		
		row["rectcost"] = rectcostDataSYTSet.getDouble("rectcost");
	}
	
	rectcostDataSYTSet.close();
// rectcost



// materialapicost 
	materialapicostDataSYTSet = MXReportDataSetProvider.create(this.getDataSource().getName(), "materialapicostDataSYTSet");
	materialapicostDataSYTSet.open();
	
	materialapicostSQL =

 " (select sum(nvl(detail_a,0)) materialapicost  FROM  csx_roadway_projacct_mv where "
  + "  task_number_i  IN(SELECT mach.csxpurposecode FROM asset mach WHERE  mach.parent is null and mach.csxdepartment='ROADWAYS'  and  mach.location  ='"+row["location"]+"'  and mach.siteid='CSXEAM')  "
  + "    AND "+params["where1"]+" AND je_source_c = 'Payables' AND  source_x != 'PROCARD' AND (po_distribution_i IS NULL OR invoice_price_variance_a = detail_a ) " 
  + "   AND expenditure_type_c NOT  LIKE 'OS%' AND expenditure_type_c != 'FREIGHT-VENDORS')  "
	
	

		
	materialapicostDataSYTSet.setQuery(materialapicostSQL);

	if(materialapicostDataSYTSet.fetch()) {
		
		row["materialapicost"] = materialapicostDataSYTSet.getDouble("materialapicost");
	}
	
	materialapicostDataSYTSet.close();
// materialapicost


// outsideserivcecost 
	outsideserivcecostDataSYTSet = MXReportDataSetProvider.create(this.getDataSource().getName(), "outsideserivcecostDataSYTSet");
	outsideserivcecostDataSYTSet.open();
	
	outsideserivcecostSQL =

 "   (SELECT SUM(nvl(detail_a,0)) as outsideserivcecost  FROM csx_roadway_projacct_mv where "
 + "   task_number_i in (SELECT mach.csxpurposecode FROM asset mach WHERE   mach.parent is null and  mach.csxdepartment='ROADWAYS' and mach.location  ='"+row["location"]+"'  and  mach.siteid='CSXEAM'   ) "

 + " and "+params["where1"]+" AND je_source_c = 'Payables' AND (po_distribution_i IS NULL OR invoice_price_variance_a = detail_a) "
 + " and expenditure_type_c LIKE 'OS%' AND expenditure_type_c != 'FREIGHT-VENDORS') "
	
	

		
	outsideserivcecostDataSYTSet.setQuery(outsideserivcecostSQL);

	if(outsideserivcecostDataSYTSet.fetch()) {
		
		row["outsideserivcecost"] = outsideserivcecostDataSYTSet.getDouble("outsideserivcecost");
	}
	
	outsideserivcecostDataSYTSet.close();
// outsideserivcecost


// procardcost 
	procardcostDataSYTSet = MXReportDataSetProvider.create(this.getDataSource().getName(), "procardcostDataSYTSet");
	procardcostDataSYTSet.open();
	
	procardcostSQL =

 " (SELECT sum(nvl(cc.detail_a,0)) as procardcost FROM csx_roadway_machines_mv cc ,csxrdwyproassign pc WHERE    "+params["where1"]+"  AND cc.je_source_c = 'Payables'  AND  cc.expenditure_type_c = 'MTL-PROCUREMENT CARD' AND (cc.po_distribution_i IS NULL OR cc.invoice_price_variance_a = cc.detail_a) AND cc.expenditure_type_c NOT LIKE 'OS%'  AND  "

 + " cc.expenditure_type_c != 'FREIGHT-VENDORS' and cc.invoice_i=pc.csxrdwyprocard(+) and pc.CSXRDWYASSIGNCODE  ='"+row["location"]+"' )  "

	
	

		
	procardcostDataSYTSet.setQuery(procardcostSQL);

	if(procardcostDataSYTSet.fetch()) {
		
		row["procardcost"] = procardcostDataSYTSet.getDouble("procardcost");
	}
	
	procardcostDataSYTSet.close();
// materialapicost









return (true);]]></method>
        </script-data-set>
    </data-sets>
    <styles>
        <style name="crosstab-cell" id="343">
            <property name="borderBottomColor">#CCCCCC</property>
            <property name="borderBottomStyle">solid</property>
            <property name="borderBottomWidth">1pt</property>
            <property name="borderLeftColor">#CCCCCC</property>
            <property name="borderLeftStyle">solid</property>
            <property name="borderLeftWidth">1pt</property>
            <property name="borderRightColor">#CCCCCC</property>
            <property name="borderRightStyle">solid</property>
            <property name="borderRightWidth">1pt</property>
            <property name="borderTopColor">#CCCCCC</property>
            <property name="borderTopStyle">solid</property>
            <property name="borderTopWidth">1pt</property>
        </style>
        <style name="crosstab" id="344">
            <property name="borderBottomColor">#CCCCCC</property>
            <property name="borderBottomStyle">solid</property>
            <property name="borderBottomWidth">1pt</property>
            <property name="borderLeftColor">#CCCCCC</property>
            <property name="borderLeftStyle">solid</property>
            <property name="borderLeftWidth">1pt</property>
            <property name="borderRightColor">#CCCCCC</property>
            <property name="borderRightStyle">solid</property>
            <property name="borderRightWidth">1pt</property>
            <property name="borderTopColor">#CCCCCC</property>
            <property name="borderTopStyle">solid</property>
            <property name="borderTopWidth">1pt</property>
        </style>
    </styles>
    <page-setup>
        <simple-master-page name="maximoLandscape" id="47" extends="MaximoSystemLibrary.maximoLandscape">
            <overridden-values>
                <ref-entry baseId="304" name="NewGrid2" id="304"/>
                <ref-entry baseId="305" id="305"/>
                <ref-entry baseId="306" id="306"/>
                <ref-entry baseId="307" id="307"/>
                <ref-entry baseId="308" id="308"/>
                <ref-entry baseId="340" name="NewImage1" id="340"/>
                <ref-entry baseId="309" id="309"/>
                <ref-entry baseId="310" name="NewImage" id="310"/>
                <ref-entry baseId="322" name="NewGrid" id="322"/>
                <ref-entry baseId="323" id="323"/>
                <ref-entry baseId="324" id="324"/>
                <ref-entry baseId="325" id="325"/>
                <ref-entry baseId="326" id="326"/>
                <ref-entry baseId="328" name="NewText" id="328"/>
                <ref-entry baseId="327" id="327"/>
                <ref-entry baseId="329" name="NewGrid1" id="329"/>
                <ref-entry baseId="330" id="330"/>
                <ref-entry baseId="331" id="331"/>
                <ref-entry baseId="332" id="332"/>
                <ref-entry baseId="333" id="333"/>
                <ref-entry baseId="334" id="334"/>
                <ref-entry baseId="335" name="NewAutoText" id="335"/>
                <ref-entry baseId="336" id="336"/>
                <ref-entry baseId="337" name="NewText1" id="337"/>
                <ref-entry baseId="338" id="338"/>
                <ref-entry baseId="339" name="NewAutoText1" id="339"/>
            </overridden-values>
        </simple-master-page>
    </page-setup>
    <body>
        <table name="mainTable" id="7">
            <property name="comments">09-19764@000</property>
            <property name="width">100%</property>
            <property name="dataSet">dataSet</property>
            <list-property name="boundDataColumns">
                <structure>
                    <property name="name">total_rec</property>
                    <expression name="expression">Total.count()</expression>
                    <property name="dataType">any</property>
                </structure>
                <structure>
                    <property name="name">location</property>
                    <text-property name="displayName">location</text-property>
                    <expression name="expression" type="javascript">dataSetRow["location"]</expression>
                    <property name="dataType">string</property>
                </structure>
                <structure>
                    <property name="name">invcost</property>
                    <text-property name="displayName">invcost</text-property>
                    <expression name="expression" type="javascript">dataSetRow["invcost"]</expression>
                    <property name="dataType">decimal</property>
                </structure>
                <structure>
                    <property name="name">rectcost</property>
                    <text-property name="displayName">rectcost</text-property>
                    <expression name="expression" type="javascript">dataSetRow["rectcost"]</expression>
                    <property name="dataType">decimal</property>
                </structure>
                <structure>
                    <property name="name">materialapicost</property>
                    <text-property name="displayName">materialapicost</text-property>
                    <expression name="expression" type="javascript">dataSetRow["materialapicost"]</expression>
                    <property name="dataType">decimal</property>
                </structure>
                <structure>
                    <property name="name">outsideserivcecost</property>
                    <text-property name="displayName">outsideserivcecost</text-property>
                    <expression name="expression" type="javascript">dataSetRow["outsideserivcecost"]</expression>
                    <property name="dataType">decimal</property>
                </structure>
                <structure>
                    <property name="name">procardcost</property>
                    <text-property name="displayName">procardcost</text-property>
                    <expression name="expression" type="javascript">dataSetRow["procardcost"]</expression>
                    <property name="dataType">decimal</property>
                </structure>
                <structure>
                    <property name="name">AmountSpent</property>
                    <text-property name="displayName">Amount Spent</text-property>
                    <expression name="expression" type="javascript">dataSetRow["invcost"]+dataSetRow["rectcost"]+dataSetRow["materialapicost"]+dataSetRow["outsideserivcecost"]+dataSetRow["procardcost"]</expression>
                    <property name="dataType">decimal</property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">currentplan</property>
                    <text-property name="displayName">currentplan</text-property>
                    <expression name="expression" type="javascript">dataSetRow["currentplan"]</expression>
                    <property name="dataType">decimal</property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">csxdivision</property>
                    <text-property name="displayName">csxdivision</text-property>
                    <expression name="expression" type="javascript">dataSetRow["csxdivision"]</expression>
                    <property name="dataType">string</property>
                </structure>
                <structure>
                    <property name="name">SYTAMOUNTSPENT</property>
                    <text-property name="displayName">Amount Spent</text-property>
                    <expression name="expression" type="javascript">dataSetRow["invcost"]+dataSetRow["rectcost"]+dataSetRow["materialapicost"]+dataSetRow["outsideserivcecost"]+dataSetRow["procardcost"]</expression>
                    <property name="dataType">decimal</property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">totrem</property>
                    <text-property name="displayName">Total Remainder</text-property>
                    <expression name="expression" type="javascript">dataSetRow["currentplan"]-row["SYTAMOUNTSPENT"]</expression>
                    <property name="dataType">decimal</property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">%spenta</property>
                    <text-property name="displayName">%spenta</text-property>
                    <expression name="expression" type="javascript">((dataSetRow["invcost"]+dataSetRow["rectcost"]+dataSetRow["materialapicost"]+dataSetRow["outsideserivcecost"]+dataSetRow["procardcost"])/dataSetRow["currentplan"])*100</expression>
                    <property name="dataType">decimal</property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">currentplan_1</property>
                    <text-property name="displayName">currentplan</text-property>
                    <expression name="expression" type="javascript">dataSetRow["currentplan"]</expression>
                    <property name="dataType">decimal</property>
                </structure>
                <structure>
                    <property name="name">currentplandiv</property>
                    <property name="dataType">float</property>
                    <property name="aggregateFunction">SUM</property>
                    <list-property name="arguments">
                        <structure>
                            <property name="name">Expression</property>
                            <expression name="value" type="javascript">row["currentplan"]</expression>
                        </structure>
                    </list-property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">invoctdiv</property>
                    <property name="dataType">float</property>
                    <property name="aggregateFunction">SUM</property>
                    <list-property name="arguments">
                        <structure>
                            <property name="name">Expression</property>
                            <expression name="value" type="javascript">row["invcost"]</expression>
                        </structure>
                    </list-property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">rectcostdiv</property>
                    <property name="dataType">float</property>
                    <property name="aggregateFunction">SUM</property>
                    <list-property name="arguments">
                        <structure>
                            <property name="name">Expression</property>
                            <expression name="value" type="javascript">row["rectcost"]</expression>
                        </structure>
                    </list-property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">outsideservice</property>
                    <property name="dataType">float</property>
                    <property name="aggregateFunction">SUM</property>
                    <list-property name="arguments">
                        <structure>
                            <property name="name">Expression</property>
                            <expression name="value" type="javascript">row["outsideserivcecost"]</expression>
                        </structure>
                    </list-property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">materialcostdiv</property>
                    <property name="dataType">float</property>
                    <property name="aggregateFunction">SUM</property>
                    <list-property name="arguments">
                        <structure>
                            <property name="name">Expression</property>
                            <expression name="value" type="javascript">row["materialapicost"]</expression>
                        </structure>
                    </list-property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">procarddiv</property>
                    <property name="dataType">float</property>
                    <property name="aggregateFunction">SUM</property>
                    <list-property name="arguments">
                        <structure>
                            <property name="name">Expression</property>
                            <expression name="value" type="javascript">row["procardcost"]</expression>
                        </structure>
                    </list-property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">sysamountdiv</property>
                    <property name="dataType">float</property>
                    <property name="aggregateFunction">SUM</property>
                    <list-property name="arguments">
                        <structure>
                            <property name="name">Expression</property>
                            <expression name="value" type="javascript">row["SYTAMOUNTSPENT"]</expression>
                        </structure>
                    </list-property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">totremdiv</property>
                    <property name="dataType">float</property>
                    <property name="aggregateFunction">SUM</property>
                    <list-property name="arguments">
                        <structure>
                            <property name="name">Expression</property>
                            <expression name="value" type="javascript">row["new1"]</expression>
                        </structure>
                    </list-property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">region</property>
                    <text-property name="displayName">region</text-property>
                    <expression name="expression" type="javascript">dataSetRow["region"]</expression>
                    <property name="dataType">string</property>
                </structure>
                <structure>
                    <property name="name">Aggregation</property>
                    <property name="dataType">decimal</property>
                    <simple-property-list name="aggregateOn">
                        <value>region</value>
                    </simple-property-list>
                    <property name="aggregateFunction">SUM</property>
                    <list-property name="arguments">
                        <structure>
                            <property name="name">Expression</property>
                            <expression name="value" type="javascript">row["SYTAMOUNTSPENT"]</expression>
                        </structure>
                    </list-property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">new1</property>
                    <text-property name="displayName">Total Remainder</text-property>
                    <expression name="expression" type="javascript">row["currentdist"]-row["Aggregation"]</expression>
                    <property name="dataType">decimal</property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">Aggregation_1</property>
                    <property name="dataType">decimal</property>
                    <simple-property-list name="aggregateOn">
                        <value>region</value>
                    </simple-property-list>
                    <property name="aggregateFunction">SUM</property>
                    <list-property name="arguments">
                        <structure>
                            <property name="name">Expression</property>
                            <expression name="value" type="javascript">row["invcost"]</expression>
                        </structure>
                    </list-property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">Aggregation_2</property>
                    <property name="dataType">float</property>
                    <simple-property-list name="aggregateOn">
                        <value>region</value>
                    </simple-property-list>
                    <property name="aggregateFunction">SUM</property>
                    <list-property name="arguments">
                        <structure>
                            <property name="name">Expression</property>
                            <expression name="value" type="javascript">row["rectcost"]</expression>
                        </structure>
                    </list-property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">Aggregation_3</property>
                    <property name="dataType">float</property>
                    <simple-property-list name="aggregateOn">
                        <value>region</value>
                    </simple-property-list>
                    <property name="aggregateFunction">SUM</property>
                    <list-property name="arguments">
                        <structure>
                            <property name="name">Expression</property>
                            <expression name="value" type="javascript">row["outsideserivcecost"]</expression>
                        </structure>
                    </list-property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">Aggregation_4</property>
                    <property name="dataType">float</property>
                    <simple-property-list name="aggregateOn">
                        <value>region</value>
                    </simple-property-list>
                    <property name="aggregateFunction">SUM</property>
                    <list-property name="arguments">
                        <structure>
                            <property name="name">Expression</property>
                            <expression name="value" type="javascript">row["materialapicost"]</expression>
                        </structure>
                    </list-property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">Aggregation_5</property>
                    <property name="dataType">float</property>
                    <simple-property-list name="aggregateOn">
                        <value>region</value>
                    </simple-property-list>
                    <property name="aggregateFunction">SUM</property>
                    <list-property name="arguments">
                        <structure>
                            <property name="name">Expression</property>
                            <expression name="value" type="javascript">row["procardcost"]</expression>
                        </structure>
                    </list-property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">%spent</property>
                    <expression name="expression" type="javascript">(row["Aggregation"]/row["currentdist"])*100</expression>
                    <property name="dataType">decimal</property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">sumcurrentplan</property>
                    <property name="dataType">float</property>
                    <property name="aggregateFunction">SUM</property>
                    <list-property name="arguments">
                        <structure>
                            <property name="name">Expression</property>
                            <expression name="value" type="javascript">row["currentdist"]</expression>
                        </structure>
                    </list-property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">Column Binding</property>
                    <expression name="expression" type="javascript">(row["sysamountdiv"]/row["sumcurrentplan"])*100</expression>
                    <property name="dataType">float</property>
                    <property name="allowExport">true</property>
                </structure>
                <structure>
                    <property name="name">CSXRDWYFYEAR</property>
                    <text-property name="displayName">CSXRDWYFYEAR</text-property>
                    <expression name="expression" type="javascript">dataSetRow["CSXRDWYFYEAR"]</expression>
                    <property name="dataType">string</property>
                </structure>
                <structure>
                    <property name="name">CSXRDWYPDMONTH</property>
                    <text-property name="displayName">CSXRDWYPDMONTH</text-property>
                    <expression name="expression" type="javascript">dataSetRow["CSXRDWYPDMONTH"]</expression>
                    <property name="dataType">string</property>
                </structure>
                <structure>
                    <property name="name">CSXRDWYPERIOD</property>
                    <text-property name="displayName">CSXRDWYPERIOD</text-property>
                    <expression name="expression" type="javascript">dataSetRow["CSXRDWYPERIOD"]</expression>
                    <property name="dataType">string</property>
                </structure>
                <structure>
                    <property name="name">currentdist</property>
                    <property name="dataType">float</property>
                    <simple-property-list name="aggregateOn">
                        <value>region</value>
                    </simple-property-list>
                    <property name="aggregateFunction">MAX</property>
                    <list-property name="arguments">
                        <structure>
                            <property name="name">Expression</property>
                            <expression name="value" type="javascript">row["currentplan"]</expression>
                        </structure>
                    </list-property>
                    <property name="allowExport">true</property>
                </structure>
            </list-property>
            <property name="pageBreakInterval">50</property>
            <column id="83"/>
            <column id="754"/>
            <column id="460"/>
            <column id="391"/>
            <column id="79"/>
            <column id="91"/>
            <column id="87"/>
            <column id="17"/>
            <column id="18"/>
            <column id="374"/>
            <column id="365">
                <property name="fontWeight">bold</property>
            </column>
            <header>
                <row id="180">
                    <property name="style">title</property>
                    <cell id="181">
                        <property name="colSpan">9</property>
                        <property name="rowSpan">1</property>
                        <label id="381">
                            <property name="textAlign">center</property>
                            <property name="refTemplateParameter">NewTemplateParameterDefinition</property>
                            <text-property name="text">Division Budget Allocation Report</text-property>
                        </label>
                    </cell>
                    <cell id="366"/>
                    <cell id="357"/>
                </row>
                <row id="173">
                    <property name="height">0.08in</property>
                    <cell id="174">
                        <property name="colSpan">9</property>
                        <property name="rowSpan">1</property>
                        <property name="borderBottomColor">#000000</property>
                        <property name="borderBottomStyle">solid</property>
                        <property name="borderBottomWidth">thin</property>
                    </cell>
                    <cell id="367">
                        <property name="borderBottomColor">#000000</property>
                        <property name="borderBottomStyle">solid</property>
                        <property name="borderBottomWidth">thin</property>
                    </cell>
                    <cell id="358">
                        <property name="borderBottomColor">#000000</property>
                        <property name="borderBottomStyle">solid</property>
                        <property name="borderBottomWidth">thin</property>
                    </cell>
                </row>
                <row id="166">
                    <cell id="167">
                        <property name="colSpan">9</property>
                        <property name="rowSpan">1</property>
                        <property name="borderBottomColor">#000000</property>
                        <property name="borderBottomStyle">solid</property>
                        <property name="borderBottomWidth">thin</property>
                        <grid id="109">
                            <property name="width">100%</property>
                            <column id="110">
                                <property name="width">1in</property>
                                <property name="style">reportheaderlabel</property>
                            </column>
                            <column id="111">
                                <property name="width">8.875in</property>
                                <property name="style">reportheaderdata</property>
                            </column>
                            <row id="141">
                                <property name="height">0.06in</property>
                                <cell id="142"/>
                                <cell id="143">
                                    <property name="paddingLeft">2px</property>
                                </cell>
                            </row>
                            <row id="112">
                                <cell id="113">
                                    <label id="118">
                                        <text-property name="text">Year:	</text-property>
                                    </label>
                                </cell>
                                <cell id="114">
                                    <property name="paddingLeft">2px</property>
                                    <data id="767">
                                        <property name="resultSetColumn">CSXRDWYFYEAR</property>
                                    </data>
                                </cell>
                            </row>
                            <row id="115">
                                <cell id="116">
                                    <label id="119">
                                        <text-property name="text">Period:</text-property>
                                    </label>
                                </cell>
                                <cell id="117">
                                    <property name="paddingLeft">2px</property>
                                    <data id="768">
                                        <property name="resultSetColumn">CSXRDWYPDMONTH</property>
                                    </data>
                                </cell>
                            </row>
                            <row id="126">
                                <property name="height">0.06in</property>
                                <cell id="127">
                                    <label id="770">
                                        <text-property name="text">Period End</text-property>
                                    </label>
                                </cell>
                                <cell id="128">
                                    <property name="paddingLeft">2px</property>
                                    <data id="769">
                                        <structure name="dateTimeFormat">
                                            <property name="category">Long Date</property>
                                            <property name="pattern">Long Date</property>
                                        </structure>
                                        <property name="resultSetColumn">CSXRDWYPERIOD</property>
                                    </data>
                                </cell>
                            </row>
                        </grid>
                    </cell>
                    <cell id="368">
                        <property name="borderBottomColor">#000000</property>
                        <property name="borderBottomStyle">solid</property>
                        <property name="borderBottomWidth">thin</property>
                    </cell>
                    <cell id="359">
                        <property name="borderBottomColor">#000000</property>
                        <property name="borderBottomStyle">solid</property>
                        <property name="borderBottomWidth">thin</property>
                    </cell>
                </row>
                <row id="144">
                    <property name="height">0.06in</property>
                    <cell id="145">
                        <property name="colSpan">9</property>
                        <property name="rowSpan">1</property>
                    </cell>
                    <cell id="369"/>
                    <cell id="360"/>
                </row>
                <row id="8">
                    <property name="style">tabledetailslabel</property>
                    <cell id="80">
                        <property name="style">tabledetailslabelcell</property>
                        <label id="755">
                            <property name="textAlign">left</property>
                            <text-property name="text">Region</text-property>
                        </label>
                    </cell>
                    <cell id="748">
                        <property name="style">tabledetailslabelcell</property>
                        <label id="393">
                            <property name="textAlign">left</property>
                            <text-property name="text">Current Plan</text-property>
                        </label>
                    </cell>
                    <cell id="456">
                        <property name="style">tabledetailslabelcell</property>
                        <label id="351">
                            <text-property name="text">Team/Entity</text-property>
                        </label>
                    </cell>
                    <cell id="387">
                        <property name="style">tabledetailslabelcell</property>
                        <label id="352">
                            <text-property name="text">Charges Material</text-property>
                        </label>
                    </cell>
                    <cell id="76">
                        <property name="style">tabledetailslabelcell</property>
                        <label id="353">
                            <text-property name="text">Receipt Charges</text-property>
                        </label>
                    </cell>
                    <cell id="88">
                        <property name="style">tabledetailslabelcell</property>
                        <label id="354">
                            <text-property name="text">Outside Services</text-property>
                        </label>
                    </cell>
                    <cell id="84">
                        <property name="style">tabledetailslabelcell</property>
                        <label id="355">
                            <text-property name="text">AP-1's</text-property>
                        </label>
                    </cell>
                    <cell id="9">
                        <property name="style">tabledetailslabelcell</property>
                        <label id="356">
                            <text-property name="text">Actual credit Cards</text-property>
                        </label>
                    </cell>
                    <cell id="10">
                        <property name="style">tabledetailslabelcell</property>
                        <label id="376">
                            <text-property name="text">Amount Spent</text-property>
                        </label>
                    </cell>
                    <cell id="370">
                        <property name="style">tabledetailslabelcell</property>
                        <label id="672">
                            <text-property name="text">Total Remainder</text-property>
                        </label>
                    </cell>
                    <cell id="361">
                        <property name="style">tabledetailslabelcell</property>
                        <label id="673">
                            <text-property name="text">% of spend vs Plan</text-property>
                        </label>
                    </cell>
                </row>
            </header>
            <group id="719">
                <property name="groupName">region</property>
                <expression name="keyExpr" type="javascript">row["region"]</expression>
                <structure name="toc">
                    <expression name="expressionValue" type="javascript">row["region"]</expression>
                </structure>
                <property name="hideDetail">false</property>
                <header>
                    <row id="720">
                        <cell id="721">
                            <data id="743">
                                <property name="textAlign">left</property>
                                <property name="resultSetColumn">region</property>
                            </data>
                        </cell>
                        <cell id="749"/>
                        <cell id="722"/>
                        <cell id="723"/>
                        <cell id="724"/>
                        <cell id="725"/>
                        <cell id="726"/>
                        <cell id="727"/>
                        <cell id="728"/>
                        <cell id="729"/>
                        <cell id="730"/>
                    </row>
                </header>
                <footer>
                    <row id="731">
                        <property name="borderBottomColor">#000000</property>
                        <property name="borderBottomStyle">solid</property>
                        <property name="borderBottomWidth">thin</property>
                        <property name="borderTopColor">#000000</property>
                        <property name="borderTopStyle">solid</property>
                        <property name="borderTopWidth">thin</property>
                        <property name="textAlign">right</property>
                        <cell id="732"/>
                        <cell id="751">
                            <data id="799">
                                <structure name="numberFormat">
                                    <property name="category">Fixed</property>
                                    <property name="pattern">###0.00{RoundingMode=HALF_UP}</property>
                                </structure>
                                <property name="textAlign">left</property>
                                <property name="resultSetColumn">currentdist</property>
                            </data>
                        </cell>
                        <cell id="733"/>
                        <cell id="734">
                            <data id="759">
                                <structure name="numberFormat">
                                    <property name="category">Fixed</property>
                                    <property name="pattern">###0.00;(###0.00){RoundingMode=HALF_UP}</property>
                                </structure>
                                <property name="resultSetColumn">Aggregation_1</property>
                            </data>
                        </cell>
                        <cell id="735">
                            <data id="760">
                                <structure name="numberFormat">
                                    <property name="category">Fixed</property>
                                    <property name="pattern">###0.00;(###0.00){RoundingMode=HALF_UP}</property>
                                </structure>
                                <property name="resultSetColumn">Aggregation_2</property>
                            </data>
                        </cell>
                        <cell id="736">
                            <data id="761">
                                <structure name="numberFormat">
                                    <property name="category">Fixed</property>
                                    <property name="pattern">###0.00;(###0.00){RoundingMode=HALF_UP}</property>
                                </structure>
                                <property name="resultSetColumn">Aggregation_3</property>
                            </data>
                        </cell>
                        <cell id="737">
                            <data id="762">
                                <structure name="numberFormat">
                                    <property name="category">Fixed</property>
                                    <property name="pattern">###0.00;(###0.00){RoundingMode=HALF_UP}</property>
                                </structure>
                                <property name="resultSetColumn">Aggregation_4</property>
                            </data>
                        </cell>
                        <cell id="738">
                            <data id="763">
                                <structure name="numberFormat">
                                    <property name="category">Fixed</property>
                                    <property name="pattern">###0.00;(###0.00){RoundingMode=HALF_UP}</property>
                                </structure>
                                <property name="resultSetColumn">Aggregation_5</property>
                            </data>
                        </cell>
                        <cell id="739">
                            <data id="758">
                                <structure name="numberFormat">
                                    <property name="category">Fixed</property>
                                    <property name="pattern">###0.00;(###0.00){RoundingMode=HALF_UP}</property>
                                </structure>
                                <property name="resultSetColumn">Aggregation</property>
                            </data>
                        </cell>
                        <cell id="740">
                            <data id="674">
                                <structure name="numberFormat">
                                    <property name="category">Fixed</property>
                                    <property name="pattern">###0.00;(###0.00){RoundingMode=HALF_UP}</property>
                                </structure>
                                <list-property name="highlightRules">
                                    <structure>
                                        <property name="operator">lt</property>
                                        <property name="fontSize">7pt</property>
                                        <property name="color">#FF0000</property>
                                        <expression name="testExpr" type="javascript">row["new1"]</expression>
                                        <simple-property-list name="value1">
                                            <value type="javascript">0</value>
                                        </simple-property-list>
                                    </structure>
                                </list-property>
                                <property name="resultSetColumn">new1</property>
                            </data>
                        </cell>
                        <cell id="741">
                            <data id="764">
                                <structure name="numberFormat">
                                    <property name="category">Fixed</property>
                                    <property name="pattern">###0.00{RoundingMode=HALF_UP}</property>
                                </structure>
                                <property name="resultSetColumn">%spent</property>
                            </data>
                        </cell>
                    </row>
                </footer>
            </group>
            <detail>
                <row id="11">
                    <property name="style">tabledetailsdatarow</property>
                    <property name="borderTopColor">#000000</property>
                    <property name="borderTopStyle">dotted</property>
                    <property name="borderTopWidth">thin</property>
                    <cell id="81">
                        <property name="style">tabledetailsdatacell</property>
                    </cell>
                    <cell id="750">
                        <property name="style">tabledetailsdatacell</property>
                        <data id="798">
                            <structure name="numberFormat">
                                <property name="category">Fixed</property>
                                <property name="pattern">###0.00;(###0.00){RoundingMode=HALF_UP}</property>
                            </structure>
                            <property name="textAlign">left</property>
                            <list-property name="visibility">
                                <structure>
                                    <property name="format">all</property>
                                    <expression name="valueExpr" type="javascript">true</expression>
                                </structure>
                            </list-property>
                            <property name="resultSetColumn">currentplan</property>
                        </data>
                    </cell>
                    <cell id="457">
                        <property name="style">tabledetailsdatacell</property>
                        <data id="345">
                            <property name="resultSetColumn">location</property>
                        </data>
                    </cell>
                    <cell id="388">
                        <property name="style">tabledetailsdatacell</property>
                        <data id="346">
                            <structure name="numberFormat">
                                <property name="category">Fixed</property>
                                <property name="pattern">###0.00;(###0.00){RoundingMode=HALF_UP}</property>
                            </structure>
                            <property name="resultSetColumn">invcost</property>
                        </data>
                    </cell>
                    <cell id="77">
                        <property name="style">tabledetailsdatacell</property>
                        <data id="347">
                            <structure name="numberFormat">
                                <property name="category">Fixed</property>
                                <property name="pattern">###0.00;(###0.00){RoundingMode=HALF_UP}</property>
                            </structure>
                            <property name="resultSetColumn">rectcost</property>
                        </data>
                    </cell>
                    <cell id="89">
                        <property name="style">tabledetailsdatacell</property>
                        <data id="349">
                            <structure name="numberFormat">
                                <property name="category">Fixed</property>
                                <property name="pattern">###0.00;(###0.00){RoundingMode=HALF_UP}</property>
                            </structure>
                            <property name="resultSetColumn">outsideserivcecost</property>
                        </data>
                    </cell>
                    <cell id="85">
                        <property name="style">tabledetailsdatacell</property>
                        <data id="348">
                            <structure name="numberFormat">
                                <property name="category">Fixed</property>
                                <property name="pattern">###0.00;(###0.00){RoundingMode=HALF_UP}</property>
                            </structure>
                            <property name="resultSetColumn">materialapicost</property>
                        </data>
                    </cell>
                    <cell id="12">
                        <property name="style">tabledetailsdatacell</property>
                        <data id="350">
                            <structure name="numberFormat">
                                <property name="category">Fixed</property>
                                <property name="pattern">###0.00;(###0.00){RoundingMode=HALF_UP}</property>
                            </structure>
                            <property name="resultSetColumn">procardcost</property>
                        </data>
                    </cell>
                    <cell id="13">
                        <property name="style">tabledetailsdatacell</property>
                        <data id="675">
                            <structure name="numberFormat">
                                <property name="category">Fixed</property>
                                <property name="pattern">###0.00{RoundingMode=HALF_UP}</property>
                            </structure>
                            <property name="resultSetColumn">SYTAMOUNTSPENT</property>
                        </data>
                    </cell>
                    <cell id="371">
                        <property name="style">tabledetailsdatacell</property>
                    </cell>
                    <cell id="362">
                        <property name="style">tabledetailsdatacell</property>
                    </cell>
                </row>
            </detail>
            <footer>
                <row id="14">
                    <property name="height">0.12in</property>
                    <property name="fontWeight">bold</property>
                    <property name="borderBottomColor">#000000</property>
                    <property name="borderBottomStyle">solid</property>
                    <property name="borderBottomWidth">thin</property>
                    <property name="borderTopColor">#000000</property>
                    <property name="borderTopStyle">solid</property>
                    <property name="borderTopWidth">thin</property>
                    <cell id="82">
                        <property name="colSpan">1</property>
                        <property name="rowSpan">1</property>
                    </cell>
                    <cell id="752">
                        <data id="765">
                            <structure name="numberFormat">
                                <property name="category">Fixed</property>
                                <property name="pattern">###0.00{RoundingMode=HALF_UP}</property>
                            </structure>
                            <property name="textAlign">left</property>
                            <property name="resultSetColumn">sumcurrentplan</property>
                        </data>
                    </cell>
                    <cell id="683"/>
                    <cell id="684">
                        <data id="693">
                            <structure name="numberFormat">
                                <property name="category">Fixed</property>
                                <property name="pattern">###0.00;(###0.00){RoundingMode=HALF_UP}</property>
                            </structure>
                            <property name="textAlign">right</property>
                            <property name="resultSetColumn">invoctdiv</property>
                        </data>
                    </cell>
                    <cell id="685">
                        <data id="694">
                            <structure name="numberFormat">
                                <property name="category">Fixed</property>
                                <property name="pattern">###0.00;(###0.00){RoundingMode=HALF_UP}</property>
                            </structure>
                            <property name="textAlign">right</property>
                            <property name="resultSetColumn">rectcostdiv</property>
                        </data>
                    </cell>
                    <cell id="686">
                        <data id="695">
                            <structure name="numberFormat">
                                <property name="category">Fixed</property>
                                <property name="pattern">###0.00;(###0.00){RoundingMode=HALF_UP}</property>
                            </structure>
                            <property name="textAlign">right</property>
                            <property name="resultSetColumn">outsideservice</property>
                        </data>
                    </cell>
                    <cell id="687">
                        <data id="696">
                            <structure name="numberFormat">
                                <property name="category">Fixed</property>
                                <property name="pattern">###0.00;(###0.00){RoundingMode=HALF_UP}</property>
                            </structure>
                            <property name="textAlign">right</property>
                            <property name="resultSetColumn">materialcostdiv</property>
                        </data>
                    </cell>
                    <cell id="688">
                        <data id="697">
                            <structure name="numberFormat">
                                <property name="category">Fixed</property>
                                <property name="pattern">###0.00;(###0.00){RoundingMode=HALF_UP}</property>
                            </structure>
                            <property name="textAlign">right</property>
                            <property name="resultSetColumn">procarddiv</property>
                        </data>
                    </cell>
                    <cell id="689">
                        <data id="698">
                            <structure name="numberFormat">
                                <property name="category">Fixed</property>
                                <property name="pattern">###0.00;(###0.00){RoundingMode=HALF_UP}</property>
                            </structure>
                            <property name="textAlign">right</property>
                            <property name="resultSetColumn">sysamountdiv</property>
                        </data>
                    </cell>
                    <cell id="372">
                        <data id="699">
                            <structure name="numberFormat">
                                <property name="category">Fixed</property>
                                <property name="pattern">###0.00;(###0.00){RoundingMode=HALF_UP}</property>
                            </structure>
                            <property name="textAlign">right</property>
                            <list-property name="highlightRules">
                                <structure>
                                    <property name="operator">lt</property>
                                    <property name="fontSize">7pt</property>
                                    <property name="color">#FF0000</property>
                                    <expression name="testExpr" type="javascript">row["totremdiv"]</expression>
                                    <simple-property-list name="value1">
                                        <value type="javascript">0</value>
                                    </simple-property-list>
                                </structure>
                            </list-property>
                            <property name="resultSetColumn">totremdiv</property>
                        </data>
                    </cell>
                    <cell id="363">
                        <data id="766">
                            <structure name="numberFormat">
                                <property name="category">Fixed</property>
                                <property name="pattern">###0.00{RoundingMode=HALF_UP}</property>
                            </structure>
                            <property name="textAlign">right</property>
                            <property name="resultSetColumn">Column Binding</property>
                        </data>
                    </cell>
                </row>
                <row id="207">
                    <list-property name="visibility">
                        <structure>
                            <property name="format">all</property>
                            <expression name="valueExpr" type="javascript">true</expression>
                        </structure>
                    </list-property>
                    <cell id="208">
                        <property name="colSpan">9</property>
                        <property name="rowSpan">1</property>
                        <property name="borderBottomColor">#000000</property>
                        <property name="borderBottomStyle">solid</property>
                        <property name="borderBottomWidth">thin</property>
                        <property name="borderTopColor">#000000</property>
                        <property name="borderTopStyle">solid</property>
                        <property name="borderTopWidth">thin</property>
                        <grid id="216">
                            <property name="width">100%</property>
                            <column id="217">
                                <property name="width">1.4in</property>
                                <property name="style">summarylabel</property>
                            </column>
                            <column id="218">
                                <property name="width">8.4895833333in</property>
                                <property name="style">summarydata</property>
                            </column>
                            <row id="219">
                                <cell id="220">
                                    <label id="222">
                                        <text-property name="text">Number of Records:</text-property>
                                    </label>
                                </cell>
                                <cell id="221">
                                    <data id="223">
                                        <property name="resultSetColumn">total_rec</property>
                                    </data>
                                </cell>
                            </row>
                        </grid>
                    </cell>
                    <cell id="373">
                        <property name="borderBottomColor">#000000</property>
                        <property name="borderBottomStyle">solid</property>
                        <property name="borderBottomWidth">thin</property>
                        <property name="borderTopColor">#000000</property>
                        <property name="borderTopStyle">solid</property>
                        <property name="borderTopWidth">thin</property>
                    </cell>
                    <cell id="364">
                        <property name="borderBottomColor">#000000</property>
                        <property name="borderBottomStyle">solid</property>
                        <property name="borderBottomWidth">thin</property>
                        <property name="borderTopColor">#000000</property>
                        <property name="borderTopStyle">solid</property>
                        <property name="borderTopWidth">thin</property>
                    </cell>
                </row>
            </footer>
        </table>
    </body>
</report>