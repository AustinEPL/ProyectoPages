// scripts.js

document.addEventListener("DOMContentLoaded", function() {
    const inscritosRadios = document.querySelectorAll('input[name="inscritoCiclo"]');
    const edadInput = document.getElementById("edad");
    const nombreInput = document.getElementById("nombres");
    const apellidosInput = document.getElementById("apellidos");
    const codigoInput = document.getElementById("codigo");
    const emailInput = document.getElementById("email");
    const telefonoInput = document.getElementById("telefono");
    const carreraSelect = document.getElementById("carrera");
    const submitButton = document.getElementById("submitButton");

    function checkFormStatus() {
        const edad = parseInt(edadInput.value, 10);
        const inscritoNo = document.getElementById("inscritoNo").checked;
        const inscritoSi = document.getElementById("inscritoSi").checked;

        if (inscritoNo) {
            disableAllInputsRadio();
            submitButton.disabled = true;
        } else if (edad < 18) {
            disableAllInputsEdad();
            submitButton.disabled = true;
        } else {
            enableAllInputs();
            submitButton.disabled = !areInputsFilled();
        }
    }

    function areInputsFilled() {
        return nombreInput.value.trim() !== "" &&
            apellidosInput.value.trim() !== "" &&
            codigoInput.value.trim() !== "" &&
            emailInput.value.trim() !== "" &&
            telefonoInput.value.trim() !== "" &&
            carreraSelect.value.trim() !== "";
    }

    function disableAllInputsRadio() {
        nombreInput.disabled = true;
        apellidosInput.disabled = true;
        codigoInput.disabled = true;
        emailInput.disabled = true;
        telefonoInput.disabled = true;
        carreraSelect.disabled = true;
        edadInput.disabled = true;
        submitButton.disabled = true;
    }
    function disableAllInputsEdad() {

        nombreInput.disabled = true;
        apellidosInput.disabled = true;
        codigoInput.disabled = true;
        emailInput.disabled = true;
        telefonoInput.disabled = true;
        carreraSelect.disabled = true;
        submitButton.disabled = true;
        inscritosRadios.disabled=true;

    }

    function enableAllInputs() {
        nombreInput.disabled = false;
        apellidosInput.disabled = false;
        codigoInput.disabled = false;
        emailInput.disabled = false;
        telefonoInput.disabled = false;
        carreraSelect.disabled = false;
        edadInput.disabled = false;
    }

    inscritosRadios.forEach(radio => {
        radio.addEventListener("change", checkFormStatus);
    });

    edadInput.addEventListener("input", checkFormStatus);
    nombreInput.addEventListener("input", checkFormStatus);
    apellidosInput.addEventListener("input", checkFormStatus);
    codigoInput.addEventListener("input", checkFormStatus);
    emailInput.addEventListener("input", checkFormStatus);
    telefonoInput.addEventListener("input", checkFormStatus);
    carreraSelect.addEventListener("change", checkFormStatus);
});

function toggleTable() {
    const table = document.getElementById("registradosTable");
    table.style.display = table.style.display === "none" ? "table" : "none";
}
