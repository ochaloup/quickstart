package org.jboss.as.quickstarts.ejb.remote.client.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class TestEntity {
    @Id
    @Column(name = "string", unique = false, length = 500)
    private String value;

    public TestEntity(String value) {
        setValue(value);
    }

    public TestEntity() {
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}