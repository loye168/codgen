<#include "include/head.ftl">
package ${NamespaceBll};

import com.qtone.aow.bll.BaseBll;
import ${NamespaceModel}.${Po};

<#include "include/copyright.ftl">

/**
 * ��${tableLabel}�� ҵ���߼���ӿ�
 * @author ${copyright.author}
 *
 */
public interface ${Po}Bll extends BaseBll<${Po}> {
	/**
	 * ȡ�÷���Ĭ�����������м�¼��
	 * @return
	 */
	long getRecordCount();  
	<#list table.columnList as column>
	<#if column.primaryKey>
	/**
	 * ��������ȡ��һ��ʵ��ģ��
	 * @param ${column.columnName?uncap_first} ����
	 * @return
	 */
	${Po} queryForObject(${column.columnSimpleClassName} ${column.columnName?uncap_first});
	/**
	 * ��������ɾ��һ��ʵ��ģ��
	 * @param ${column.columnName?uncap_first} ����
	 * @return Ӱ���¼������������1�����򷵻�0
	 */
	int delete(${column.columnSimpleClassName} ${column.columnName?uncap_first});
	</#if>	
	</#list>
}