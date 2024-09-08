//
//  CourseDetailView.swift
//  app-01
//
//  Created by Enrique Macias on 13/08/24.
//

import SwiftUI

struct CourseDetailView: View {
    // Variables de estado para almacenar la información del curso
    @State private var courseTitle: String
    @State private var courseID: String
    @State private var courseLocation: String
    @State private var selectedColor: Color
    @State private var showCourseScheduleView = false
    @State private var selectedDays: String
    @State private var classHours: String
    
    var onCreateCourse: (Course) -> Void
    var courseToEdit: Course?
    
    // Colores disponibles para la selección
    let availableColors: [Color] = [Color("BtnColor"), Color(red: 172/255, green: 63/255, blue: 62/255), Color(red: 0/255, green: 113/255, blue: 45/255), Color(red: 250/255, green: 188/255, blue: 63/255), Color(red: 217/255, green: 108/255, blue: 70/255), Color(red: 101/255, green: 95/255, blue: 206/255)]
    
    @Environment(\.presentationMode) var presentationMode 
    
    // Inicializador que toma en cuenta si estamos creando o editando
    init(courseToEdit: Course? = nil, onCreateCourse: @escaping (Course) -> Void) {
        self.courseToEdit = courseToEdit
        self.onCreateCourse = onCreateCourse
        
        // Si hay un curso para editar, prellenamos los campos, si no, dejamos valores por defecto
        _courseTitle = State(initialValue: courseToEdit?.title ?? "")
        _courseID = State(initialValue: courseToEdit?.courseID ?? "")
        _courseLocation = State(initialValue: courseToEdit?.location ?? "")
        _selectedColor = State(initialValue: courseToEdit?.color ?? Color.blue)
        _selectedDays = State(initialValue: courseToEdit?.days ?? "Select Days")
        _classHours = State(initialValue: courseToEdit?.classHours ?? "Hours")
    }
    
    var body: some View {
        VStack {
            // TextField para el título del curso
            TextField("Name your course", text: $courseTitle)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.horizontal)
                .padding(.top, 40)
            
            // TextField para el ID del curso
            TextField("Course ID", text: $courseID)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.horizontal)
            
            // Botón para elegir la fecha y hora del curso
            Button(action: {
                showCourseScheduleView.toggle() // Mostrar CourseScheduleView como Bottom Sheet
            }) {
                HStack {
                    Text("Choose date")
                        .foregroundColor(.black)
                    Spacer()
                    Text("\(selectedDays), \(classHours)") // Mostrar la fecha y hora seleccionadas
                        .foregroundColor(.gray)
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.horizontal)
            }
            .sheet(isPresented: $showCourseScheduleView) {
                CourseScheduleView(
                    selectedDays: $selectedDays,
                    classHours: $classHours
                )
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
            }
            
            // Selector de color para el curso
            VStack(alignment: .leading) {
                Text("Choose color")
                    .font(.subheadline)
                    .padding(.leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(availableColors, id: \.self) { color in
                            Circle()
                                .fill(color)
                                .frame(width: 30, height: 30)
                                .opacity(selectedColor == color ? 1 : 0.3) // Opaca los colores no seleccionados
                                .onTapGesture {
                                    selectedColor = color
                                }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.vertical)
            
            // TextField para la ubicación del curso
            TextField("Course Location", text: $courseLocation)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.horizontal)
            
            Spacer()
            
            // Botón para crear o actualizar el curso
            Button(action: {
                let courseId = courseToEdit?.id ?? UUID()
                // Crear o actualizar el curso
                let newCourse = Course(id: courseId, title: courseTitle, courseID: courseID, days: selectedDays, classHours: classHours, color: selectedColor, location: courseLocation)
                
                onCreateCourse(newCourse) // Acción para crear o actualizar el curso
                presentationMode.wrappedValue.dismiss() // Cerrar la vista
            }) {
                Text(courseToEdit == nil ? "Create Course" : "Update Course") // Cambiar el texto del botón si estamos editando
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("BtnColor"))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.bottom, 20)
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(onCreateCourse: {_ in})
    }
}
