# Example: Task Management API Discovery Session

This is an example of what a clarify-session.md file might look like after a thorough requirements gathering session.

Started: 2024-01-15

## Questions Asked

1. What is the primary goal of this project? → Build a REST API for task management
2. Who are the target users? → Development teams managing their work items
3. What programming language should be used? → Node.js with TypeScript
4. What framework? → Express.js with Prisma ORM
5. What database? → PostgreSQL
6. What authentication method? → JWT tokens with refresh token support
7. Should there be user roles? → Yes, admin and regular user roles
8. What are the main entities? → Users, Tasks, Projects
9. What CRUD operations are needed? → Full CRUD for all entities
10. Should tasks have priorities? → Yes, low/medium/high/critical
11. Should tasks have status? → Yes, todo/in-progress/done/blocked
12. Should tasks be assignable? → Yes, to specific users
13. Should there be due dates? → Yes, optional due dates
14. Should there be comments on tasks? → Yes
15. What about file attachments? → Nice to have, but not MVP
16. Should there be notifications? → Not in MVP
17. What about real-time updates? → Not in MVP
18. Should the API be versioned? → Yes, start with /api/v1
19. What about rate limiting? → Yes, implement basic rate limiting
20. What about CORS? → Yes, configurable CORS
21. What about validation? → Use class-validator for input validation
22. What error format? → Consistent JSON error format
23. What about logging? → Use Winston for logging
24. What about API documentation? → Auto-generate with Swagger/OpenAPI
25. What about testing? → Unit tests with Jest, integration tests for endpoints
26. What about database migrations? → Use Prisma migrations
27. What about environment variables? → Use dotenv
28. What about Docker? → Provide Dockerfile
29. What about health checks? → Yes, /health endpoint
30. What about metrics? → Basic metrics, not MVP
31. What response codes should be used? → Standard HTTP codes (200, 201, 400, 401, 403, 404, 500)
32. Should there be pagination? → Yes, for list endpoints
33. Should there be filtering? → Yes, basic filtering on list endpoints
34. Should there be sorting? → Yes, by created date and priority
35. What about soft deletes? → Yes, use soft deletes
36. Should tasks have tags? → Nice to have, not MVP
37. Should there be task dependencies? → Not in MVP
38. What about bulk operations? → Not in MVP
39. Should there be search? → Basic search by title/description
40. What about email notifications? → Not in MVP
41. What about webhooks? → Not in MVP
42. Should there be audit logs? → Basic audit logs for sensitive operations
43. What about password requirements? → Min 8 chars, at least one number and special char
44. Should passwords be hashed? → Yes, with bcrypt
45. What about password reset? → Not in MVP
46. Should there be session management? → JWT-based, no server-side sessions
47. What about token expiry? → Access tokens expire in 15 minutes, refresh tokens in 7 days
48. Should there be API keys? → Not in MVP
49. What about request validation? → Validate all inputs
50. What about SQL injection prevention? → Use Prisma parameterized queries

## Answers Received

### Core Functionality
- REST API for managing tasks, projects, and users
- Full CRUD operations for all entities
- User authentication and authorization
- Basic search and filtering
- Pagination for list endpoints

### Technical Stack
- Language: Node.js with TypeScript
- Framework: Express.js
- Database: PostgreSQL
- ORM: Prisma
- Authentication: JWT tokens
- Validation: class-validator
- Logging: Winston
- Testing: Jest
- Documentation: Swagger/OpenAPI

### Users & Context
- Target users: Development teams
- Two roles: Admin and regular user
- Environment: Development initially, then production
- Docker support required

### Integration Points
- No external integrations in MVP
- Future: Email service, notification service

### Quality Attributes
- Performance: Handle 100 concurrent users minimum
- Security: JWT auth, password hashing, input validation, SQL injection prevention
- Scalability: Design for horizontal scaling
- Monitoring: Basic health checks and logging

### Edge Cases & Error Handling
- Consistent JSON error responses
- Proper HTTP status codes
- Validation of all inputs
- Graceful handling of database errors
- Rate limiting to prevent abuse

## Emerging Requirements

### Must Have (MVP)
- User registration and login with JWT
- CRUD operations for Users, Tasks, and Projects
- Task assignment to users
- Task priority (low/medium/high/critical)
- Task status (todo/in-progress/done/blocked)
- Basic search by task title/description
- Pagination for list endpoints
- Input validation
- Error handling with consistent format
- Health check endpoint
- API documentation with Swagger
- Unit and integration tests
- Docker support
- Database migrations with Prisma

### Should Have
- Filtering on list endpoints
- Sorting by created date and priority
- Soft deletes
- Basic audit logs
- Rate limiting
- CORS configuration

### Nice to Have
- Task comments
- File attachments
- Tags for tasks
- Task dependencies
- Bulk operations
- Real-time updates
- Notifications
- Metrics dashboard

### Explicitly Out of Scope
- Email notifications (future)
- Webhooks (future)
- Password reset (future)
- API keys (future)
- Advanced reporting
- Mobile app
