//
//  EditStudentView.swift
//  app-01
//
//  Created by Enrique Macias on 07/08/24.
//

import SwiftUI

struct EditStudentView: View {
    @Binding var student: Student
    @Environment(\.presentationMode) var presentationMode
    
    @State private var birthday = Date() // Fecha de nacimiento del estudiante
    
    @State private var showToast = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            // Botón de regreso
            HStack {
                Button(action: {
                    // Acción para regresar
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .foregroundColor(Color("BtnColor"))
                }
                Spacer()
            }
            .padding(.leading)
            
            // Título "Edit Profile"
            Text("Edit Profile")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            // Imagen de perfil
            VStack {
                ZStack {
                    // Imagen circular
                    Image(systemName: "person.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .padding(5)
                        .overlay(Circle().stroke(Color("BtnColor"), lineWidth: 5))
                    
                    // Botón de edición para la imagen
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(Color("BtnColor"))
                        .offset(x: 40, y: 40)
                }
            }
            .frame(maxWidth: .infinity)
            
            // Campos de texto para nombre, matrícula, carrera
            VStack(alignment: .leading, spacing: 15) {
                // Nombre
                VStack(alignment: .leading, spacing: 5) {
                    Text("Name")
                        .font(.caption)
                        .foregroundColor(.gray)
                    TextField("Enter your Name", text: $student.name)
                        .textInputAutocapitalization(.never)
                        .padding(.vertical, 10)
                        .overlay(
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.gray),
                            alignment: .bottom
                        )
                }
                
                // Matrícula
                VStack(alignment: .leading, spacing: 5) {
                    Text("Student ID")
                        .font(.caption)
                        .foregroundColor(.gray)
                    TextField("Enter your Student ID", text: $student.studentID)
                        .textInputAutocapitalization(.never)
                        .padding(.vertical, 10)
                        .overlay(
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.gray),
                            alignment: .bottom
                        )
                }
                
                // Programa
                VStack(alignment: .leading, spacing: 5) {
                    Text("Degree")
                        .font(.caption)
                        .foregroundColor(.gray)
                    TextField("Enter your Degree Name", text: $student.program)
                        .textInputAutocapitalization(.never)
                        .padding(.vertical, 10)
                        .overlay(
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.gray),
                            alignment: .bottom
                        )
                }
                
                // Fecha de nacimiento
                VStack(alignment: .leading, spacing: 5) {
                    Text("Birthdate")
                        .font(.caption)
                        .foregroundColor(.gray)
                    DatePicker("", selection: $birthday, displayedComponents: .date)
                        .datePickerStyle(CompactDatePickerStyle())
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Botón para guardar los cambios
            Button(action: {
                // Acción para guardar cambios
                withAnimation {showToast = true}
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showToast = false
                }
            }) {
                Text("Save Changes")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("BtnColor"))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .padding(.top)
        .navigationBarHidden(true)
        
        if showToast {
            VStack {
                Spacer()
                Text("Save with success")
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.bottom, 20)
            }
            .transition(.move(edge: .bottom))
        }
    }
}

struct EditStudentView_Previews: PreviewProvider {
    static var previews: some View {
        @State var  Student = Student(name: "", studentID: "", program: "")
        EditStudentView(student: $Student)
    }
}
