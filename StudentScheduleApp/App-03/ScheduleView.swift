//
//  ContentView.swift
//  app-01
//
//  Created by Enrique Macias on 06/08/24.
//

import SwiftUI

struct ScheduleView: View {
    @State private var student = Student(name: "Username", studentID: "ID", program: "Degree")
    @State private var currentDay = ""
    @State private var currentDayNumber = ""
    @State private var currentMonth = ""
    @State private var currentTime = ""

    @State private var showCourseDetailView = false
    @State private var courses: [Course] = []
    @State private var selectedCourse: Course? = nil
    
    @State private var showCiberseguridad = true
    @State private var showMachineLearning = true
    @State private var showiOSDevelopment = true

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {

                // Header: Saludo y Configuración
                HStack {
                    VStack(alignment: .leading) {
                        Text("Welcome, \(student.name)!") // Mensaje bienvenida con nombre de estudiante
                            .font(.headline)
                            .bold()
                        Text(student.studentID) // Matrícula
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text(student.program) // Carrera Estudiando (siglas)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    // Botón de Configuración - Editar Estudiante
                    NavigationLink(destination: EditStudentView(student: $student)) {
                        Image(systemName: "gear")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.gray)
                            .alignmentGuide(.top) { d in d[.top]}
                            .padding(.trailing, 10)
                    }
                }
                .padding(.horizontal)
                
                // Today
                HStack {
                    Button(action: {}) {
                        Text("Today")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.black)
                            .cornerRadius(20)
                    }
                    
                    Spacer()
                    
                    // Botón para crear Cursos
                    Button(action: {
                        showCourseDetailView.toggle()
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                
                // Sección de Fecha
                HStack {
                    VStack(alignment: .leading) {
                        Text(currentDay)
                            .font(.title3)
                            .bold()
                        Text(currentDayNumber)
                            .font(.system(size: 48))
                            .bold()
                        Text(currentMonth)
                            .font(.title3)
                    }
                    
                    // Línea vertical
                    Divider()
                        .frame(height: 100)
                        .padding(.horizontal)
                    
                    VStack(alignment: .trailing) {
                        Text(currentTime)
                            .font(.headline)
                            .bold()
                        Text("Monterrey")
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
                // línea horizontal
                Divider()
                    .padding(.horizontal)
                
                // Cards de Eventos
                ScrollView {
                    VStack(spacing: 16) {
                        // Tarjeta estática de Ciberseguridad
                        if showCiberseguridad {
                            EventCard(
                                title: "Ciberseguridad",
                                id: "TC1005",
                                location: "Aulas III-304",
                                days: "Lunes, Miércoles, Viernes",
                                classHours: "11:10 - 12:50",
                                deleteCourse: {
                                    // Ocultar tarjeta de Ciberseguridad
                                    showCiberseguridad = false
                                },
                                editCourse: {
                                    selectedCourse = Course(
                                        title: "Ciberseguridad",
                                        courseID: "TC1005",
                                        days: "Lunes, Miércoles, Viernes",
                                        classHours: "11:10 - 12:50",
                                        color: Color(red: 172/255, green: 63/255, blue: 62/255),
                                        location: "Aulas III-304"
                                    )
                                    showCourseDetailView = true
                                },
                                shareCourse: {
                                    shareCourse(Course(title: "Ciberseguridad", courseID: "TC1005", days: "Lunes, Miércoles, Viernes", classHours: "11:10 - 12:50", color: Color(red: 172/255, green: 63/255, blue: 62/255), location: "Aulas III-304"))
                                }
                            )
                            .background(Color(red: 172/255, green: 63/255, blue: 62/255))  // Color rojo oscuro
                            .cornerRadius(15)
                        }
                        
                        // Tarjeta estática de Machine Learning
                        if showMachineLearning {
                            EventCard(
                                title: "Machine Learning",
                                id: "TC2045",
                                location: "Aulas IV-201",
                                days: "Martes, Jueves",
                                classHours: "13:10 - 14:50",
                                deleteCourse: {
                                    showMachineLearning = false
                                },
                                editCourse: {
                                    selectedCourse = Course(
                                        title: "Machine Learning",
                                        courseID: "TC2045",
                                        days: "Martes, Jueves",
                                        classHours: "13:10 - 14:50",
                                        color: Color(red: 217/255, green: 108/255, blue: 70/255),
                                        location: "Aulas IV-201"
                                    )
                                    showCourseDetailView = true
                                },
                                shareCourse: {
                                    shareCourse(Course(title: "Machine Learning", courseID: "TC2045", days: "Martes, Jueves", classHours: "13:10 - 14:50", color: Color(red: 217/255, green: 108/255, blue: 70/255), location: "Aulas IV-201"))
                                }
                            )
                            .background(Color(red: 217/255, green: 108/255, blue: 70/255))  // Color naranja
                            .cornerRadius(15)
                        }
                        
                        // Tarjeta estática de iOS Development
                        if showiOSDevelopment {
                            EventCard(
                                title: "iOS Development",
                                id: "TC1034",
                                location: "Aulas I-105",
                                days: "Viernes",
                                classHours: "19:00 - 20:00",
                                deleteCourse: {
                                    showiOSDevelopment = false
                                },
                                editCourse: {
                                    selectedCourse = Course(
                                        title: "iOS Development",
                                        courseID: "TC1034",
                                        days: "Viernes",
                                        classHours: "19:00 - 20:00",
                                        color: Color(red: 101/255, green: 95/255, blue: 206/255),
                                        location: "Aulas I-105"
                                    )
                                    showCourseDetailView = true
                                },
                                shareCourse: {
                                    shareCourse(Course(title: "iOS Development", courseID: "TC1034", days: "Viernes", classHours: "19:00 - 20:00", color: Color(red: 101/255, green: 95/255, blue: 206/255), location: "Aulas I-105"))
                                }
                            )
                            .background(Color(red: 101/255, green: 95/255, blue: 206/255))  // Color púrpura
                            .cornerRadius(15)
                        }
                        
                        // Tarjetas creadas por el usuario
                        ForEach(courses) { course in
                            EventCard(
                                title: course.title,
                                id: course.courseID,
                                location: course.location,
                                days: course.days,
                                classHours: course.classHours,
                                deleteCourse: { deleteCourse(course) }, // Función de eliminar
                                editCourse: { editCourse(course) },     // Función de editar
                                shareCourse: { shareCourse(course) }    // Función de compartir
                            )
                            .background(course.color)
                            .cornerRadius(15)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top, 40)
            .navigationBarHidden(true)
            .onAppear {
                updateDateTime()
            }
            .sheet(isPresented: $showCourseDetailView) {
                CourseDetailView(courseToEdit: selectedCourse) { updatedCourse in
                    if let index = courses.firstIndex(where: { $0.id == updatedCourse.id }) {
                        courses[index] = updatedCourse
                    } else {
                        courses.append(updatedCourse)
                    }
                    selectedCourse = nil
                }
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
            }

        }
    }
    
    // Función para actualizar la fecha y hora actuales
    func updateDateTime() {
        let now = Date()
        let dateFormatter = DateFormatter()
        
        // Formato para el día de la semana
        dateFormatter.dateFormat = "EEEE"
        currentDay = dateFormatter.string(from: now)
        
        // Formato para el número del día
        dateFormatter.dateFormat = "dd"
        currentDayNumber = dateFormatter.string(from: now)
        
        // Formato para el mes (en mayúsculas)
        dateFormatter.dateFormat = "MMMM"
        currentMonth = dateFormatter.string(from: now).uppercased()
        
        // Formato para la hora actual
        dateFormatter.dateFormat = "HH:mm"
        currentTime = dateFormatter.string(from: now)
    }
    
    // Función para eliminar un curso dinámico
    func deleteCourse(_ course: Course) {
        courses.removeAll { $0.id == course.id }
    }
    
    // Función para editar un curso dinámico
    func editCourse(_ course: Course) {
        selectedCourse = course
        showCourseDetailView = true
    }
    
    // Función para compartir un curso
    func shareCourse(_ course: Course) {
        let activityController = UIActivityViewController(activityItems: ["Curso: \(course.title), ID: \(course.courseID), en \(course.location)"], applicationActivities: nil)
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene.windows.first?.rootViewController?.present(activityController, animated: true, completion: nil)
        }
    }
}


// Componente de tarjeta de evento con menú contextual
struct EventCard: View {
    var title: String
    var id: String
    var location: String
    var days: String
    var classHours: String
    var deleteCourse: () -> Void
    var editCourse: () -> Void
    var shareCourse: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Text(id)
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
            }
            
            // Días del curso
            HStack {
                Image(systemName: "calendar")
                    .foregroundStyle(Color.white)
                Text(days)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
            }
            
            // Horario del curso
            HStack {
                Image(systemName: "clock")
                    .foregroundStyle(Color.white)
                Text(classHours)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
            }
            
            Spacer()
            
            HStack {
                Image(systemName: "mappin")
                    .foregroundStyle(Color.white)
                Text(location)
                    .foregroundStyle(Color.white)
            }
        }
        .padding()
        .cornerRadius(16)
        .shadow(radius: 5)
        .frame(height: 150)
        .contextMenu {
            Button(action: deleteCourse) {
                Label("Delete Course", systemImage: "trash")
                    .foregroundColor(.red)
            }
            Button(action: editCourse) {
                Label("Edit Course", systemImage: "pencil")
            }
            Button(action: shareCourse) {
                Label("Share Course", systemImage: "square.and.arrow.up")
            }
        }
    }
}


struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
