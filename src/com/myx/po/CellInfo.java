package com.myx.po;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public class CellInfo {
    private int id;
    private String cellname;
    private String building;
    private String roomno;
    private String area;
    private String type;
    private String price;
    private String picture;
    private String selection;
    private String username;

    private List<MultipartFile> mtf;

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

    public String getBuilding() {
        return building;
    }

    public void setBuilding(String building) {
        this.building = building;
    }

    public String getRoomno() {
        return roomno;
    }

    public void setRoomno(String roomno) {
        this.roomno = roomno;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getSelection() {
        return selection;
    }

    public void setSelection(String selection) {
        this.selection = selection;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<MultipartFile> getMtf() {
        return mtf;
    }

    public void setMtf(List<MultipartFile> mtf) {
        this.mtf = mtf;
    }

    @Override
    public String toString() {
        return "CellInfo{" +
                "id=" + id +
                ", cellname='" + cellname + '\'' +
                ", building='" + building + '\'' +
                ", roomno='" + roomno + '\'' +
                ", area='" + area + '\'' +
                ", type='" + type + '\'' +
                ", price='" + price + '\'' +
                ", picture='" + picture + '\'' +
                ", selection='" + selection + '\'' +
                ", username='" + username + '\'' +
                ", mtf=" + mtf +
                '}';
    }
}
