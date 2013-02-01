package com.bcs.codgen.service.impl;

import org.apache.commons.lang.StringUtils;

import com.bcs.codgen.model.ColumnModel;
import com.bcs.codgen.service.ColumnHandler;

/**
 * 针对java编程环境的数据类型转换器
 * @author 黄天政
 *
 */
public class DataTypeConverterForJava implements ColumnHandler {

	public void handle(ColumnModel columnModel) {
		String javaType = columnModel.getColumnClassName();
		if("java.math.BigDecimal".equals(javaType) ){
			if(columnModel.getScale()>0){
				javaType = "java.lang.Double";
			}else{
				javaType="java.lang.Long";
			}
        }else if("java.sql.Timestamp".equals(javaType)){
        	javaType="java.util.Date";
        }
//        else{
//        	type="java.lang.String";
//        }
		
		//根据具体数据库方言中的数据类型确定java编程语言中的数据类型
		String typeName = columnModel.getColumnTypeName();
		if("decimal".equalsIgnoreCase(typeName)
			||"money".equalsIgnoreCase(typeName)
			||"numeric".equalsIgnoreCase(typeName)
			||"float".equalsIgnoreCase(typeName)
			||"smallmoney".equalsIgnoreCase(typeName)){
			javaType = "java.lang.Double";
		}
		
		columnModel.setColumnClassName(javaType);
		columnModel.setColumnSimpleClassName(StringUtils.substringAfterLast(javaType, "."));//从全限定名中截取简单类名
		//设置具体编程语言的数据类型所在的包，如java.lang.String的命名空间为java.lang
		columnModel.setColumnClassPackage(StringUtils.substringBeforeLast(javaType, "."));
	}

}
