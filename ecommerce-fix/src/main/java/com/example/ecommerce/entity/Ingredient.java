package com.example.ecommerce.entity;


import com.example.ecommerce.dto.IngredientInfo;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@SqlResultSetMappings(
        value = {
                @SqlResultSetMapping(
                        name = "ingredientInfo",
                        classes = @ConstructorResult(
                                targetClass = IngredientInfo.class,
                                columns = {
                                        @ColumnResult(name = "id", type = Integer.class),
                                        @ColumnResult(name = "name", type = String.class),
                                        @ColumnResult(name = "detail", type = String.class),
                                        @ColumnResult(name = "riskLevel", type = Integer.class),
                                        @ColumnResult(name = "uses", type = String.class),
                                        @ColumnResult(name = "guide", type = String.class),
                                        @ColumnResult(name = "skinCompatibility", type = String.class)
                                }
                        )
                )
        }
)
@NamedNativeQuery(
        name = "getListIngredients",
        resultSetMapping = "ingredientInfo",
        query = "SELECT id, name, detail, risk_level AS riskLevel, uses, guide, skin_compatibility AS skinCompatibility\n" +
                "FROM ingredients"
)

@Table(name = "ingredients")
@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Ingredient {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false, length = 255)
    private String name;

    @Column(name = "detail", columnDefinition = "TEXT")
    private String detail;

    @Column(name = "risk_level")
    private Integer riskLevel;

    @Column(name = "uses", length = 255)
    private String uses;

    @Column(name = "guide", columnDefinition = "TEXT")
    private String guide;

    @Column(name = "skin_compatibility", length = 255)
    private String skinCompatibility;

}