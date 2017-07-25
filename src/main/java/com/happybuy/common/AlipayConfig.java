package com.happybuy.common;

/**
 * Created by 徐豪 on 2017/7/7/007.
 */
public class AlipayConfig {

    //商户id
    public static String appId = "2016080600182273";

    //支付宝网关
    public static String serverURL = "https://openapi.alipaydev.com/gateway.do";

    //私钥
    public static String privateKey = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCxesADxySMDLmNqbTXG+RcWNk2tWwmudDw5kB64RE0RvbUqkUqYEZeI3EGmbdQ9R09OhoilgZ5xbTYlTDYtv3nU/C6wXAFT09fDj6V39Lr1tuoJO+23WJbXxb+b21WbyQMxyURmfX9dWZ6wag/PxZVC1SrK5cZuc30mpxI5Vh5/+CxqZK4wSwcSNTpevw2VjuPtrvwpFHDujo5aacvFKEuM/PHsTvOBMQXCCFzpsJsLaVB+Y3yDmQwuABA92ROWWCYY3s1C6sIwXgjlVW0QaMB132qk8VzKum+H1NTzeji91u7sQl8uGIpH0l33W6yKak+TBgVvEit+8lpqZapLspdAgMBAAECggEAfKA5nW2FmGKHGZcFyddoMACj5urWmwr4UXEd7iuFLTR3tzYpg2w/fXNdtsjSFSNJ+OiH2amHupK+PyfkOQmmmX40GLAkvVXH4nPaNtwI/FrPu+7T9ZDXtFm9h8Uu/fblVaOxv/5g4i5CXAkI4ACo6ece+WOOox36Jb076WRDEMcVPnukfEok6AjVI4UIFv9e4k8wDvVRCZRpzFA/5vQS62R7gTcc6vAP56CmO/lhvNI2wU3Vltn2KWhPNajkxMXnFU509qXc5mm6FANVx0RsvOPYgEQ7EGJfTp39US0Pul4E23UzZTmbvF3ZQrhZOZYESEfyW7SHEyzmOSu/4dBKAQKBgQDjhS5pZgHptNmedykyj0ZltgHCMBt45QslCqF/+8kVjinij2RGvRmSOxFewV8j7TZhHJ1rng/LS9gepFIQ6GE6ECNXeEzQ5SH2WvJZVBTjdQ5OGmfWIcM0P465Os+vbSM1TUwe3jHNsLdmhL5jMp8cb3xrqn9w7l4BQ6xqCTD9YQKBgQDHsgcgjn/K1hR3PXX4ZvWL1WajYh12gOMWVfRuisl0WnaR+mfNeEUj+eky/qXjToDH65H89uuWzlIBFh1QHj0m+02LYJC6VzV/4fkQ1RIAlTdBNS6ynQG2EUKAKEnlTzaSS/t/J5wXbgzZC3SDFm5H1q/W8V/C/WLDjZoPx1pSfQKBgGWkc+2GMsiTkLzogzEhLNP3kaWNFFjYCjiMHUYt19GXZ0LdyHCJvkjDtqjcPoKwUKDlxbX0MR4jTfOyeS8wgW8NEpzbE4YnNxr12lrp40MSYkemKElTX/+RfVNm4K2AVkBTvfP0U8+OaQCVwPBUBx0O+UioLLLo6noqH3ZnkMlBAoGBALTFJcqE9I3rKW+fhXEt0s2YimcQZFdn6SnI+ZIvtJnNYlRW9yx62SvuCPoOpqCT6eQQDYGPDEjh0D4HhNWH6helmda3vYvRci6nos1n8/nvGau/ttwdYPUtvqNA1VPtVxssCShb9OMIzjyUMA6SeZYyc88BhYx/z63yOypZbhwJAoGATFDJx1tVK3jqle29Eb3oQKr1qrWV+Ki/H6yP437kgPYpUhONqjaATIWpeMMMY/faQRYG57sbq1uXRqi9Hcvi9pn2scLWRkGMuF/y98sTVZ0bdjdn87u4PEcD32MrRTloHIdZstJwDLHWpu9CA/c3varckeS9IflW0X0ztnxOEBk=";

    //公钥
    public static String publicKey = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAw3SjzmdmgiuQ0ikVeYL5Xj3bGbiqyuWM7Z/o87rxTmS93Mp9x7oyAv387/gPRNlQn84siOEopl1J7HCCYY3XBHh4oeDxZuyFKJO/cXjXE90gB9ICiR665/SPLjXvu0kj7LkPDcuMIeUmgusBwu/1mHRjX9zVeovfI8zSUigBgQR4uSQxqHyjqAKXGkTJhEzhKeTHUZJzR3D0uJAiAJZaZZf4WP1YWcjy3O/V2xTgnzWTiAENNXUKc7LlChrKzpIg5D84pMJOrBy4wimkVt/rsFwg1jOPUIfO+oHezd/SIWpHwDWbGCgiiZhfUm5D+JxX2oRZMtJxXDZctM3iuN0ISQIDAQAB";

    //签名方式
    public static String signType = "RSA2";

    //字符编码格式
    public static String charset = "utf-8";

    //同步返回的页面（或者Controller层）
    public static String returnURL = "http://39jtte.natappfree.cc/happybuy/order/orderPayState";

    //异步返回的页面
    public static String notifyUrl = "";
}
