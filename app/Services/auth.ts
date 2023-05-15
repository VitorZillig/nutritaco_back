import jwt from 'jsonwebtoken';
import { Router, Request, Response, NextFunction } from 'express';

export function verifyJWT(req: Request, res:Response, next: NextFunction){
    var token = req.headers.authorization?.split(" ")[1];
    if (!token) return res.status(401).send({ auth: false, message: 'No token provided.' });
    
    jwt.verify(token, "123", function(err, decoded) {
      if (err) return res.status(500).send({ auth: false, message: 'Failed to authenticate token.' });
      
      // se tudo estiver ok, salva no request para uso posterior
      next();
    });
  }

// export const generateJWT