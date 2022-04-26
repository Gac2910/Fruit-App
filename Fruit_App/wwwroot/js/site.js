function getAllFruits() {
    $("#fruit-form")[0].reset()
    $.ajax({
        type: "GET",
        url: "/Fruits/Get",
        success: function (res) {
            res = JSON.parse(res)
            buildTable(res)
        },
        failure: function () {
            console.log("request failure")
        }
    })
}

function insertClick() {
    $.ajax({
        type: "POST",
        url: "/Fruits/Post",
        data: {
            Name: $("#name-input").val().trim(),
            Color: $("#color-input").val().trim(),
            Taste: $("#taste-input").val().trim(),
        },
        success: function (res) {
            console.log(res)
            getAllFruits()
        },
        failure: function () {
            console.log("request failure")
        }
    })
}

function buildTable(table) {
    let body = ""
    for (let i = 0; i < table.length; i++) {
        body += `
            <tr>
                <td>${table[i].id}</td>
                    <td>${table[i].name}</td>
                    <td>${table[i].color}</td>
                    <td>${table[i].taste}</td>
                <td>
                    <button onclick="deleteClick('${table[i].id}')" class="btn btn-danger">Delete</button>
                    &emsp;
                    <button
                        onclick="updateClick(
                            '${table[i].id}', 
                            '${table[i].name}', 
                            '${table[i].color}', 
                            '${table[i].taste}')"
                        class="btn btn-primary">
                        Update
                    </button>
                </td>
            </tr>`
    }
    $("#fruits-tbody").html(body);
}

function deleteClick(id) {
    $.ajax({
        type: "DELETE",
        url: `/Fruits/Delete?id=${id}`,
        success: function (res) {
            console.log(res)
            getAllFruits()
        },
        failure: function () {
            console.log("request failure")
        }
    })
}

function updateClick(id, name, color, taste) {
    $("#name-input").val(name)
    $("#color-input").val(color)
    $("#taste-input").val(taste)
    $("#form-title").html("Update Fruit " + id)
    $("#insert-btn").css("display", "none")
    $("#update-btn").css("display", "inline")
}

function updateFruit() {
    let id = $("#form-title").html().split(" ").pop()
    $.ajax({
        type: "PUT",
        url: `/Fruits/Put?id=${id}`,
        data: {
            Id: id,
            Name: $("#name-input").val().trim(),
            Color: $("#color-input").val().trim(),
            Taste: $("#taste-input").val().trim(),
        },
        success: function (res) {
            console.log(res)
            getAllFruits()
            $("#form-title").html("Insert New Fruit")
            $("#update-btn").css("display", "none")
            $("#insert-btn").css("display", "inline")
        },
        failure: function () {
            console.log("request failure")
        }
    })
}