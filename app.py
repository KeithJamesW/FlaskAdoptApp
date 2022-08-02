from flask import Flask, url_for, render_template, redirect, flash, jsonify

from flask_debugtoolbar import DebugToolbarExtension

from models import db, connect_db, Pet
from forms import AddPetForm, EditPetForm

app = Flask(__name__)

app.config['SECRET_KEY'] = "truth777"
app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql:///adopt"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

connect_db(app)
db.create_all()



@app.route("/")
def list_pets():
    

    pets = Pet.query.all()
    return render_template("pets.html", pets=pets)



@app.route("/add", methods=["GET", "POST"])
def add_pet():
    

    form = AddPetForm()

    if form.validate_on_submit():
        data = {k: v for k, v in form.data.items() if k != "csrf_token"}
        new_pet = Pet(**data)
        db.session.add(new_pet)
        db.session.commit()
        flash(f"{new_pet.name} successfully added!")
        return redirect(url_for('list_pets'))

    else:
        
        return render_template("new_pet_form.html", form=form)



@app.route("/<int:pet_id>", methods=["GET", "POST"])
def edit_pet(pet_id):
    

    pet = Pet.query.get_or_404(pet_id)
    form = EditPetForm(obj=pet)

    if form.validate_on_submit():
        pet.notes = form.notes.data
        pet.available = form.available.data
        pet.photo_url = form.photo_url.data
        db.session.commit()
        flash(f"{pet.name} successfully updated!")
        return redirect(url_for('list_pets'))

    else:
        
        return render_template("edit_pet_form.html", form=form, pet=pet)