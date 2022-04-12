var JobService = {
    init: function(){
      $('#addJobForm').validate({
        submitHandler: function(form) {
          var job = Object.fromEntries((new FormData(form)).entries());
          JobService.add(job);
        }
      });
      JobService.list();
    },

    list: function(){
      $.get("rest/job", function(data) {
        $("#job-list").html("");
        var html = "";
        for(let i = 0; i < data.length; i++){
          html += `
          <div class="col-lg-3">
            <div class="card" style="margin-top:30px;">
              <img class="card-img-top" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22286%22%20height%3D%22180%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20286%20180%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_17ff3c8cf14%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A14pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_17ff3c8cf14%22%3E%3Crect%20width%3D%22286%22%20height%3D%22180%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22107.19140625%22%20y%3D%2296.3%22%3E286x180%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" alt="Card image cap">
              <div class="card-body">
                <h5 class="card-title">`+ data[i].job_name +`</h5>
                <p class="card-text">`+ data[i].job_description +`</p>
                <div class="btn-group" role="group">
                  <button type="button" class="btn btn-primary job-button" onclick="JobService.get(`+data[i].id+`)">Uredi</button>
                  <button type="button" class="btn btn-danger job-button" onclick="JobService.delete(`+data[i].id+`)">Obriši</button>
                  <button type="button" class="btn btn-outline-primary job-button" onclick="WorkerService.list_by_job_id(`+data[i].id+`)">Svi radnici</button>
                </div>
              </div>
            </div>
          </div>
          `;
        }
        $("#job-list").html(html);
      });
    },

    get: function(job_id){
      $('.job-button').attr('disabled', true);
      $.get('rest/job/'+job_id, function(data){
        $("#job_name").val(data.job_name);
        $("#job_id").val(data.id);
        $("#job_description").val(data.job_description);
        $("#exampleModal").modal("show");
        $('.job-button').attr('disabled', false);
      })
    },

    add: function(job){
      $.ajax({
        url: 'rest/job',
        type: 'POST',
        data: JSON.stringify(job),
        contentType: "application/json",
        dataType: "json",
        success: function(result) {
            $("#job-list").html('<div class="spinner-border" role="status"> <span class="sr-only"></span>  </div>');
            JobService.list(); // perf optimization
            $("#addJobModal").modal("hide");
        }
      });
    },

    update: function(){
      $('.save-job-button').attr('disabled', true);
      var job = {};

      job.job_name = $('#job_name').val();
      job.job_description = $('#job_description').val();

      $.ajax({
        url: 'rest/job/'+$('#job_id').val(),
        type: 'PUT',
        data: JSON.stringify(job),
        contentType: "application/json",
        dataType: "json",
        success: function(result) {
            $("#exampleModal").modal("hide");
            $('.save-job-button').attr('disabled', false);
            $("#job-list").html('<div class="spinner-border" role="status"> <span class="sr-only"></span>  </div>');
            JobService.list(); // perf optimization
        }
      });
    },

    delete: function(job_id){
      $('.job-button').attr('disabled', true);
      $.ajax({
        url: 'rest/job/'+job_id,
        type: 'DELETE',
        success: function(result) {
            $("#job-list").html('<div class="spinner-border" role="status"> <span class="sr-only"></span>  </div>');
            JobService.list();
        }
      });
    },
}
