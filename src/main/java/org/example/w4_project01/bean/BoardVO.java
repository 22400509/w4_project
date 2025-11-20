package org.example.w4_project01.bean;

import java.util.Date;

public class BoardVO {
    private int id;
    private String title;
    private String content;
    private String date;
    private String writer;
    private String category;
    private String is_public;

    public BoardVO() {
    }

    public String getIs_public() {
        return is_public;
    }

    public void setIs_public(String is_public) {
        this.is_public = is_public;
    }

    public BoardVO(String title, String writer, String content, String category, String is_public) {
        this.title = title;
        this.writer = writer;
        this.content = content;
        this.category = category;
        this.is_public = is_public;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    private int cnt;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
