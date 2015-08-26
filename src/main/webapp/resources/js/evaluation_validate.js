$(document).ready(function() {

    var lecture_id = $("#lecture_id").val();

    $.validator.addMethod("space", function (value, element) {
        return value.indexOf(" ") < 0 && value != "";
    });

    $("#reg_frm").validate({
        onfocusout: false,
        rules: {
            semester: {
                required: true
            },method: {
                required: true,
                maxlength: 150
            }, task: {
                required: true,
                maxlength: 150
            }, exam: {
                required: true,
                maxlength: 150
            }, comment: {
                required: true
            }, score: {
                required: true
            }
        }, messages: {
            semester: {
                required: "학기를 입력하세요."
            }, method: {
                required: "수업코멘트를 입력하세요.",
                maxlength: $.validator.format("수업코멘트는 150글자 이하로 입력하세요.")
            }, task: {
                required: "과제코멘트를 입력하세요.",
                maxlength: $.validator.format("과제코멘트는 150글자 이하로 입력하세요.")
            }, exam: {
                required: "시험코멘트를 입력하세요.",
                maxlength: $.validator.format("시험코멘트는 150글자 이하로 입력하세요.")
            }, comment: {
                required: "총평코멘트 입력하세요."
            }, score: {
                required: "점수를 입력하세요."
            }
        }, submitHandler: function (form) {
            if(confirm("많은 학생들이 보게 됩니다. 감정적으로 적지 마시고 객관적으로 부탁드립니다.")){
                $.ajax({
                    type: "POST",
                    url: "/evaluation/reg",
                    dataType: "json",
                    data: $(form).serialize(),
                    success: function (result) {
                        if (result) {
                            alert("강의평가 등록이 완료되었습니다.")
                            window.open("/evaluation/list?lecture_id="+lecture_id, "_self");
                        } else {
                            alert("죄송합니다 다시 시도해주세요.");
                        }

                    }
                })
            }
        }
    })

    $("#mod_frm").validate({
        onfocusout: false,
        rules: {
            semester: {
                required: true
            },method: {
                required: true,
                maxlength: 150
            }, task: {
                required: true,
                maxlength: 150
            }, exam: {
                required: true,
                maxlength: 150
            }, comment: {
                required: true
            }, score: {
                required: true
            }
        }, messages: {
            semester: {
                required: "학기를 입력하세요."
            }, method: {
                required: "수업코멘트를 입력하세요.",
                maxlength: $.validator.format("수업코멘트는 150글자 이하로 입력하세요.")
            }, task: {
                required: "과제코멘트를 입력하세요.",
                maxlength: $.validator.format("과제코멘트는 150글자 이하로 입력하세요.")
            }, exam: {
                required: "시험코멘트를 입력하세요.",
                maxlength: $.validator.format("시험코멘트는 150글자 이하로 입력하세요.")
            }, comment: {
                required: "총평코멘트 입력하세요."
            }, score: {
                required: "점수를 입력하세요."
            }
        }, submitHandler: function (form) {
            if(confirm("많은 학생들이 보게 됩니다. 감정적으로 적지 마시고 객관적으로 부탁드립니다.")){
                $.ajax({
                    type: "POST",
                    url: "/evaluation/mod",
                    dataType: "json",
                    data: $(form).serialize(),
                    success: function (result) {
                        if (result) {
                            alert("강의평가 수정이 완료되었습니다.")
                            window.open("/evaluation/list?lecture_id="+lecture_id, "_self");
                        } else {
                            alert("죄송합니다 다시 시도해주세요.");
                        }

                    }
                })
            }
        }
    })
})