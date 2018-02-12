package net.zypro.zq.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import com.aliyun.openservices.ClientException;
import com.aliyun.openservices.ServiceException;
import com.aliyun.openservices.oss.OSSClient;
import com.aliyun.openservices.oss.OSSErrorCode;
import com.aliyun.openservices.oss.OSSException;
import com.aliyun.openservices.oss.model.CannedAccessControlList;
import com.aliyun.openservices.oss.model.GetObjectRequest;
import com.aliyun.openservices.oss.model.OSSObjectSummary;
import com.aliyun.openservices.oss.model.ObjectListing;
import com.aliyun.openservices.oss.model.ObjectMetadata;


public class OSSHelper {
	private static final String ACCESS_ID = "zyTvVHAGQSrCYhgv";
    private static final String ACCESS_KEY = "9k2j6KTava4dild1SayQ8o7iJGbrR1";
    private static final String bucketName="zypro-images";
    
    
    // ��Bucket����Ϊ�����˿ɶ�
    private static void setBucketPublicReadable(OSSClient client, String bucketName)
            throws OSSException, ClientException {
        //����bucket
        client.createBucket(bucketName);

        //����bucket�ķ���Ȩ�ޣ�public-read-writeȨ��
        client.setBucketAcl(bucketName, CannedAccessControlList.PublicRead);
    }

    // �ϴ��ļ�
    public static String uploadFile(String key,  InputStream input)
            throws OSSException, ClientException {
    	OSSClient client = new OSSClient(ACCESS_ID, ACCESS_KEY);
    	
        ObjectMetadata objectMeta = new ObjectMetadata();
        try {
			objectMeta.setContentLength(input.available());
			// ������metadata�б���ļ�����
	        objectMeta.setContentType("image/jpeg");
		    client.putObject(bucketName, key, input, objectMeta);
		    
		    return "http://"+bucketName+".oss-cn-hangzhou.aliyuncs.com/"+key;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return null;
    }
}
