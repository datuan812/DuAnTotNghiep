// Add name attribute
$(".input-name-atrribute").on("keypress", function (e) {
    if (e.which === 13) {
        e.preventDefault();
        let nameAttribute = $(e.target).val();
        if (!nameAttribute) {
            showError("Thuộc tính không được để trống");
        } else {
            $(".card-text-none-attribute").hide();
            const slugAttribute = customNameToSlug(nameAttribute);
            if (findBySlug(slugAttribute) !== undefined) {
                showError("Tên thuộc tính này đã tồn tại")
            } else {
                const eleDivProductsHasAtributes = $(
                    `<div class="product-has-attribute mb-3" data-slug="${slugAttribute}"></div>`
                );
                const eleNameAttribute = `<div class="name-attribute">
                                                <button type="button" class="btn btn-success position-relative">
                                                    ${nameAttribute}
                                                  <span class="btn-remove-parent position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                                       <i class="fa fa-trash-o btn-remove-parent-trash" aria-hidden="true"></i>
                                                  </span>
                                                </button>
                                            </div>
          
                                            <div class="input-group mt-3">
                                                <input type="text" class="form-control input-value-attribute" placeholder="Nhập giá trị"/>
                                            </div>`;
                eleDivProductsHasAtributes.html(eleNameAttribute);
                $("#card-attribute .card-body").append(eleDivProductsHasAtributes);
            }

            $(e.target).val("");
        }
    }
});

// Add value attribute
$("#card-attribute .card-body").on("click", function (e) {
    const eleClick = $(e.target);
    if (eleClick.hasClass("input-value-attribute")) {
        if (!eleClick.parent().prev().hasClass("list-value-attribute")) {
            const eleListValueAtributes = $(
                '<div class="list-value-attribute mt-3"></div>'
            );
            eleListValueAtributes.insertBefore(eleClick.parent());
        }
        eleClick.off("keypress");
        eleClick.on("keypress", function (e) {
            if (e.which === 13) {
                e.preventDefault();
                const valueAttr = eleClick.val();
                const slugCurrent = eleClick.parent().parent().data("slug");
                if (valueAttr) {
                    if (checkValuExsits(slugCurrent, valueAttr) !== undefined) {
                        showError("Gía trị thuộc tính này đã tồn tại");
                    } else {
                        const eleValueAttr = `<button type="button" class="btn btn-secondary btn-sm position-relative me-3 btn-value-attr">
              ${valueAttr}
              <span class="btn-remove-children position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                 <i class="fa fa-trash-o btn-remove-children-trash" aria-hidden="true"></i>
              </span>
        </button>`;
                        eleClick.parent().prev().append(eleValueAttr);
                        generateVariant();
                    }
                } else {
                    showError("giá trị thuộc tính không được để trống");
                }

                eleClick.val("");
            }
        });
    }
});

// Delete attribute
$("#card-attribute").on("click", (e) => {
    if (
        $(e.target).hasClass("input-name-atrribute") ||
        $(e.target).hasClass("input-value-attribute")
    ) {
        return;
    }

    if ($(e.target).hasClass("btn-remove-children")) {
        $(e.target).parent().remove();
    } else if ($(e.target).hasClass("btn-remove-children-trash")) {
        $(e.target).parent().parent().remove();
    } else if ($(e.target).hasClass("btn-remove-parent")) {
        $(e.target).parent().parent().parent().remove();
    } else if ($(e.target).hasClass("btn-remove-parent-trash")) {
        $(e.target).parent().parent().parent().parent().remove();
    }
    if ($("#card-attribute .card-body").children().length === 1) {
        $(".card-text-none-attribute").show();
    }
    generateVariant();
});

// Display image
$(".table-variant").on("click", function (e) {
    const eleClick = $(e.target);
    if (eleClick.hasClass("image-variant")) {
        $(eleClick).change(function (event) {
            var reader = new FileReader();
            var file = $(this)[0].files[0];
            reader.onload = function (e) {
            };
            reader.readAsDataURL(file);
            const className = eleClick.attr("class");
            const lastClass = className.substr(className.lastIndexOf(" ") + 1);
            openImageVariant(this, lastClass, eleClick.parent());
        });
    }
});

$("#uploadImage").change(function (event) {
    var reader = new FileReader();
    var file = $(this)[0].files[0];
    reader.onload = function (e) {
    };
    reader.readAsDataURL(file);
    openImage(this);
});

// Genertae auto slug
$("#ten").keyup(function () {
    const name = $(this).val();
    const slug = customNameToSlug(name);
    $("#slug").val(slug);
});

$("#btn-set-price").on("click", function () {
    let price = $("#price-all").val();
    $(".table-variant-body .price-variant").each((index, item) => {
        $(item).val(price);
    });
    $("#price-all").val('');
});

function generateVariant() {
    let arrayAttributes = getAttributeValues();

    let attributes = {};
    arrayAttributes.forEach((ele) => {
        let giaTris = ele.giaTris;
        attributes[ele.ten] = giaTris;
    });

    let attrs = [];
    for (const [attr, values] of Object.entries(attributes)) {
        if (values.length > 0) {
            attrs.push(values.map((v) => ({[attr]: v})));
        }
    }

    if (attrs.length > 0) {
        attrs = attrs.reduce((a, b) =>
            a.flatMap((d) => b.map((e) => ({...d, ...e})))
        );
    }
    displayVarinatsOnTable(attrs);
}

function displayVarinatsOnTable(attrs) {
    let arrs = getValueInTable();
    $("#variants").html("");
    for (const attr of attrs) {
        let row = Object.values(attr).join(",");
        let gia = "";
        let soLuong = "";

        arrs.forEach((element) => {
            if (
                element.ten === row ||
                element.ten.split(",").slice(0, -1).join(",") === row ||
                element.ten === row.split(",").slice(0, -1).join(",")
            ) {
                gia = element.gia;
                soLuong = element.soLuong;
                return false;
            }
        });
        let trcontent = `<tr>
                            <td class="text-center name-variant">${row}</td>
                            <td>
                              <input type="text" class="form-control price-variant" value="${gia}"/>
                            </td>
                            <td>
                              <input type="text" class="form-control quantity-variant" value="${soLuong}"/>
                            </td>
                            <td>                     
                              <input class="form-control image-variant" type="file">
                            </td>
                        </tr> `;
        $(".table-variant-body").append(trcontent);
    }
}

function findBySlug(slug) {
    const arrayAttributes = getAttributeValues();
    return arrayAttributes.find((ele) => {
        return ele.slug === slug;
    });
}

function checkValuExsits(slug, value) {
    const ele = findBySlug(slug);
    return ele.giaTris.find((val) => {
        return val.toLowerCase() === value.toLowerCase();
    });
}

function openImage(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            let img = $(
                '<img class="view-image me-4" style="border: 1px solid #ddd;border-radius: 4px; padding: 5px;width: 150px;">'
            );
            img.attr("src", reader.result);
            img.appendTo(".list-images");
        };
        reader.readAsDataURL(input.files[0]);
    }
}

function openImageVariant(input, imageView, eleClick) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            let img = $(
                `<img class="${imageView} mt-2 hinhanhbase64" style="width: 150px;">`
            );
            img.attr("src", reader.result);
            eleClick.append(img);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

function getImageOfProduct() {
    let attrImages = [];
    $(".list-images img").each(function () {
        let base64 = $(this).attr("src");
        let hinhAnh = null;
        let image = {hinhAnh, base64};
        attrImages.push(image);
    });
    return attrImages;
}

function getAttributeValues() {
    let arrayAttributes = [];
    $(".product-has-attribute").each(function () {
        var slug = $(this).data("slug");
        var ten = $(this).find(".name-attribute button").text().trim();

        var giaTris = [];
        $(this)
            .find(".list-value-attribute .btn-value-attr")
            .each(function () {
                giaTris.push($(this).text().trim());
            });

        arrayAttributes.push({
            slug: slug,
            ten: ten,
            giaTris: giaTris,
        });
    });
    return arrayAttributes;
}

function getVariants() {
    let variants = [];
    $(".table-variant-body tr").each((index, item) => {
        const ten = item.querySelector(".name-variant").textContent;
        let soLuong = null;
        if (item.querySelector(".quantity-variant").value !== null) {
            soLuong = item.querySelector(".quantity-variant").value;
        }
        let gia = null;
        if (item.querySelector(".price-variant").value !== null) {
            gia = item.querySelector(".price-variant").value;
        }
        let hinhanhbase64 = null;
        if (item.querySelector(".hinhanhbase64") !== null) {
            hinhanhbase64 = item.querySelector(".hinhanhbase64").src;
        }
        let variant = {};
        variant["ten"] = ten;
        variant["gia"] = gia;
        variant["soLuong"] = soLuong;
        variant["base64"] = hinhanhbase64;
        variant["hinhAnh"] = null;
        variants.push(variant);
    });
    return variants;
}

function getDataFromForm() {
    let dataFromForm = $(".form-submit-product").serializeArray();
    let data = {};
    $.each(dataFromForm, (index, value) => {
        let propertyName = value.name;
        let propertyValue = value.value;
        if (propertyName === "thongTinChiTiet") {
            propertyValue = CKEDITOR.instances.chitietsanpham.getData();
        }

        if (propertyName === "moTa") {
            propertyValue = CKEDITOR.instances.motasanpham.getData();
        }
        data[propertyName] = propertyValue;
    });
    return data;
}

function getValueInTable() {
    let arrs = [];
    $(".table-variant-body tr").each((index, item) => {
        let ten = item.querySelector(".name-variant").textContent;
        let soLuong = item.querySelector(".quantity-variant").value;
        let gia = item.querySelector(".price-variant").value;

        let data = {};
        data["ten"] = ten;
        data["soLuong"] = soLuong;
        data["gia"] = gia;

        arrs.push(data);
    });
    return arrs;
}

let attributes = [];
$.ajax({
    url: '/api/filter',
    dataType: "json",
    success: function (response) {
        $.each(response, function (index, item) {
            let attribute = {
                "value": item.ten,
                "slug": item.ma
            }
            attributes.push(attribute);
        })
        loadSuggestions(attributes);
    },
    error: function (error) {
        console.log(error);
    }
});

function loadSuggestions(options) {
    $('.input-name-atrribute').autocomplete({
        lookup: options,
        onSelect: function (suggestion) {
            let nameAttribute = suggestion.value;
            if (!nameAttribute) {
                showError("Không được để trống")
            } else {
                $(".card-text-none-attribute").hide();
                const slugAttribute = suggestion.slug;
                if (findBySlug(slugAttribute) !== undefined) {
                    showError("Thuộc tính này đã tòn tại")
                } else {
                    const eleDivProductsHasAtributes = $(
                        `<div class="product-has-attribute mb-3" data-slug="${slugAttribute}"></div>`
                    );
                    const eleNameAttribute = `<div class="name-attribute">
                                                  <button type="button" class="btn btn-success position-relative">
                                                      ${nameAttribute}
                                                    <span class="btn-remove-parent position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                                        <i class="fa fa-trash-o btn-remove-parent-trash" aria-hidden="true"></i>
                                                    </span>
                                                  </button>
                                              </div>
            
                                              <div class="input-group mt-3">
                                                  <input type="text" class="form-control input-value-attribute" placeholder="Nhập giá trị"/>
                                              </div>`;
                    eleDivProductsHasAtributes.html(eleNameAttribute);
                    $("#card-attribute .card-body").append(eleDivProductsHasAtributes);
                }
                $('.input-name-atrribute').val('');
            }
        }
    });
}

