package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "slider")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SliderEntity extends BaseEntity{

    @Column(name = "image")
    private String image;
}
