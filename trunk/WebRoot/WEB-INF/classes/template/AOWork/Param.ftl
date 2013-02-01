<#include "include/head.ftl">
package ${NamespaceParam};

import java.util.Date;
import com.qtone.aow.model.BaseParam;

<#include "include/copyright.ftl">

/**
 * ��${tableLabel}�� ����ģ��
 * @author ${copyright.author}
 *
 */
public class ${Po}Param extends BaseParam{
	private static final long serialVersionUID = 1L;
	
	<#list table.columnList as column>
	<#if column.columnName?uncap_first!="createUserID"&&column.columnName?uncap_first!="createTime"
		&&column.columnName?uncap_first!="modifyUserID"&&column.columnName?uncap_first!="modifyTime" >
	private ${column.columnSimpleClassName} ${column.columnName?uncap_first}; //${column.columnLabel}
	</#if>
	</#list>
	
	/**
	 *ʵ����һ��"${tableLabel}"����ģ�Ͷ���
	 */
	public ${Po}Param() {
		super();
		<#if primaryKey!="">
		this.setOrderBy("${primaryKey} desc");
		<#else>
		this.setOrderBy("${(table.columnList?first).columnName} desc");
		</#if>
	}
		
	@Override
	public String getTableName() {
		return "${table.tableName}";
	}
	<#if groupName?lower_case="system">
	public String getClassNameOnMUCM(){
		return "DGDP.Qtone.Model.Params.${Po}Parameter,DGDP.Qtone.Model";
	}
	</#if>
	
	<#list table.columnList as column>
	<#if column.columnName?uncap_first!="createUserID"&&column.columnName?uncap_first!="createTime"
		&&column.columnName?uncap_first!="modifyUserID"&&column.columnName?uncap_first!="modifyTime" >
	/**
	 * ȡ��"${column.columnLabel}"
	 * @return ����"${column.columnLabel}"
	 */
	public ${column.columnSimpleClassName} get${column.columnName?cap_first}(){
		return this.${column.columnName?uncap_first};
	}
	/**
	 * ����"${column.columnLabel}"��ֵ
	 * @param ${column.columnName?uncap_first} ${column.columnLabel}
	 */
	public void set${column.columnName?cap_first}(${column.columnSimpleClassName} ${column.columnName?uncap_first}){
		this.${column.columnName?uncap_first} = ${column.columnName?uncap_first};
	}
	</#if>
	</#list>
	@Override
	public String toString(){
		StringBuilder builder = new StringBuilder();
		builder.append("${Po}Param [")
		<#list table.columnList as column>
		<#if column_index==0>
		.append("${column.columnName}=").append(this.get${column.columnName?cap_first}())
		<#else>
		.append(",${column.columnName}=").append(this.get${column.columnName?cap_first}())
		</#if>
		</#list>
		.append("]");
		return builder.toString();
	}
}