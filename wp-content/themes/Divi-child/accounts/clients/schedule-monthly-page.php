<div class="main-content matchHeight">
	<div class="container-title">
        <h3>Monthly Schedule</h3>
    </div>	
	<div class="container">
      <!-- Responsive calendar - START -->
    	<div class="responsive-calendar">
        <div class="controls">
            <a class="pull-left" data-go="prev"><div class="btn btn-primary">&lt;</div></a>
            <h4><span data-head-year></span> <span data-head-month></span></h4>
            <a class="pull-right" data-go="next"><div class="btn btn-primary">&gt;</div></a>
        </div><hr/>
        <div class="day-headers">
          <div class="day header">Mon</div>
          <div class="day header">Tue</div>
          <div class="day header">Wed</div>
          <div class="day header">Thu</div>
          <div class="day header">Fri</div>
          <div class="day header">Sat</div>
          <div class="day header">Sun</div>
        </div>
        <div class="days" data-group="days"></div>
      </div>
      <!-- Responsive calendar - END -->
    </div>
</div>
<?php get_template_part( 'accounts/inc/sched-monthly-account', 'page' ); ?>