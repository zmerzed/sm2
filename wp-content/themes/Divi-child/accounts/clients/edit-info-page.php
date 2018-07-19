<div class="col-lg-12 col-md-12">
	<p><h3 style="color:#ae1f23;text-transform:uppercase;font-weight:700;">Edit info</h3></p>
	<form action="<?php echo $_SERVER['REQUEST_URI']; ?>" method="post">
		<p>
			<label>DOB</label>
			<input type="text" name="dob" datepicker />
		</p>
		<p>
			<label>Gender</label>
			<select name="gender">
				<option>-- Select gender --</option>
				<option value="0">Male</option>
				<option value="1">Female</option>
			</select>
		</p>
		<p>
			<label>Phone #</label>
			<input type="text" name="phone" />
		</p>
		<input type="submit" value="update" />
		<a href="#" class="red-btn">Cancel</a>
	</form>
</div>