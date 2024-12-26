package com.myx.po;

import org.springframework.web.multipart.MultipartFile;

public class HouseSource {
    private int id;
    private String cellname;
    private String address;
    private String picture;
    private MultipartFile mtf;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCellname() {
        return cellname;
    }

    public void setCellname(String cellname) {
        this.cellname = cellname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public MultipartFile getMtf() {
        return mtf;
    }

    public void setMtf(MultipartFile mtf) {
        this.mtf = mtf;
    }
}
